#!/bin/bash

until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

GIT_USERNAME=$GITHUB_USERNAME
GIT_PASSWORD=$GITHUB_TOKEN

BACKEND_REPO_DIR=cardi-backend
FRONTEND_REPO_DIR=cardi-frontend

FRONTEND_REPO=https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/hekisoft/cardi-project-frontend.git
BACKEND_REPO=https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/hekisoft/cardi-project-backend.git 

WORKING_DIR=/home/cardidev/cardi-project

if [-d $WORKING_DIR]; then
  cd $WORKING_DIR
else
  mkdir $WORKING_DIR && cd $WORKING_DIR
fi

git clone $FRONTEND_REPO $FRONTEND_REPO_DIR
git clone $BACKEND_REPO $BACKEND_REPO_DIR

# change directory to backend repo and start docker
cd $BACKEND_REPO_DIR

if [ -d env/app ]; then
  echo "Folder env/app exists"
else
  mkdir -p env/app
fi

if [ -d env/db ]; then
  echo "Folder env/db exists"
else
  mkdir -p env/db
fi

# create env/app/prod.env file
cat << 'EOF' > env/app/prod.env
DEBUG=0

# SECRET_KEY=<secret-key>

# Be sure to include your server IP here
# DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]

DB_ENGINE=django.db.backends.postgresql
DB_TYPE=postgres
DB_DATABASE_NAME=cardidb
DB_USERNAME=cardi_user
DB_PASSWORD=CardiDev4ever
DB_HOST=db
DB_PORT=5432

DJANGO_SUPERUSER_USERNAME=cardi_su
DJANGO_SUPERUSER_PASSWORD=CardiDev4ever
DJANGO_SUPERUSER_EMAIL=moseswillfred1@gmail.com
EOF
echo "DJANGO_ALLOWED_HOSTS=localhost ${IP_ADDRESS} 127.0.0.1 [::1]" >> env/app/prod.env
echo "SECRET_KEY=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w120 | head -n1)" >> env/app/prod.env

# create prod.env file
cat << 'EOF' > env/db/db.prod.env
POSTGRES_DB=cardidb
POSTGRES_USER=cardi_user
POSTGRES_PASSWORD=CardiDev4ever
LC_ALL=C.UTF-8
EOF

docker-compose -f docker-compose.prod.yml up -d --build

cd ../$FRONTEND_REPO_DIR
echo "REACT_APP_API_URL=http://${IP_ADDRESS}:8000" >> .env.production.local
docker-compose -f docker-compose.prod.yml up -d --build
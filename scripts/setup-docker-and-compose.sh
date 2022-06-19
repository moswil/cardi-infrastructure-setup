#!/bin/bash

until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io -y
sudo systemctl enable --now docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker ${USER}
sudo usermod -aG docker cardidev

git config --global user.name "Moses Ongwenyi"
git config --global user.email "moseswillfred1@gmail.com"

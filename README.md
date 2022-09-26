# Infrastructure Setup for Cardi Project

## Step 1: Setup

```bash
# # current working directory of the project is the root project directory
# ssh-keygen -t rsa -C "cardidev@cardisystems.com" -f ./tf-cloud-init

# # show the public key and copy it
# cat tf-cloud-init.pub

# # copy the above key and edit the file ./scripts/add-ssh-user.yml

# Copy the example templates and fill them with the correct details
cp scripts/.env.example.sh scripts/.env.sh
cp scripts/git.secrets.example.sh scripts/git.secrets.sh

# now set environment variables
source scripts/.env.sh
```

## Step 2: Setup the mail server

```bash
export ROOT_DIR=$PWD
# current working directory of the project is the root project directory
export TF_VAR_private_key_name="tf-cloud-init"

if [ -f ${TF_VAR_private_key_name} -a "${TF_VAR_private_key_name}.pub" ]; then
  # show the public key and copy it
  echo "SSH key already defined"
  export TF_VAR_cloud_init_ssh_key=$(cat ${TF_VAR_private_key_name}.pub)
else
  ssh-keygen -t rsa -C "cardidev@cardisystems.com" -f ./${TF_VAR_private_key_name}
fi
```

## Step 2: Run terraform script

```bash
cd terraform

# just source the env variables again to be sure
source ../scripts/.env.sh

# initialize terraform
terraform init

# terraform plan to see the infrastructure changes
terraform plan

# apply the changes
terraform apply
```

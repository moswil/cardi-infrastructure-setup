#!/bin/bash

until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo systemctl enable --now docker

sudo usermod -aG docker "${USER}"

git config --global user.name "Moses Ongwenyi"
git config --global user.email "moseswillfred1@gmail.com"

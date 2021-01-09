#!/bin/bash

#Instalation in preperation for terraform download
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip wget

#Download and prepare terraform
wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip
unzip terraform_0.14.4_linux_amd64.zip
sudo mv terraform /usr/local/bin
rm terraform_0.14.4_linux_amd64.zip
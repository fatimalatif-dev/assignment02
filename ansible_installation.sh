#!/bin/bash

set -e

echo "Starting Ansible installation..."

# Check if Ansible is already installed
if command -v ansible &> /dev/null; then
    echo "Ansible is already installed:"
    ansible --version
    exit 0
fi

echo "Updating system packages..."
sudo apt-get update -y

echo "Installing required dependencies..."
sudo apt-get install -y software-properties-common

echo "Adding Ansible repository..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "Installing Ansible..."
sudo apt-get install -y ansible


echo "Verifying installation..."
ansible --version

echo "Ansible installed successfully!"
#!/bin/bash

# Update package lists
sudo apt update

# Install software-properties-common
sudo apt install -y software-properties-common

# Add Ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Check Ansible version
ansible --version

echo "Ansible installation completed."

# Check if playbook.yml exists
if [ ! -f "playbook.yml" ]; then
    echo "Error: playbook.yml not found in the current directory."
    exit 1
fi

# Run the Ansible playbook against localhost
echo "Running Ansible playbook on localhost..."
ansible-playbook playbook.yml

echo "Setup completed."

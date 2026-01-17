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

# Ensure group_vars/all.yml exists
if [ ! -f "group_vars/all.yml" ]; then
    if [ -f "group_vars/all.example.yml" ]; then
        echo "group_vars/all.yml not found. Creating it from group_vars/all.example.yml..."
        cp group_vars/all.example.yml group_vars/all.yml
        echo "Created group_vars/all.yml. Please edit this file to match your environment before running."
    else
        echo "Error: group_vars/all.yml not found and group_vars/all.example.yml is missing."
        exit 1
    fi
fi

# Run the Ansible playbook against localhost
echo "Running Ansible playbook on localhost..."
ansible-playbook playbook.yml

echo "Setup completed."

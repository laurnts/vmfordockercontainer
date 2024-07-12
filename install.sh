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

# Check if setup.yml exists
if [ ! -f "setup.yml" ]; then
    echo "Error: setup.yml not found in the current directory."
    exit 1
fi

# Check if template files exist
for file in 20auto-upgrades.j2 50unattended-upgrades.j2; do
    if [ ! -f "$file" ]; then
        echo "Error: $file not found in the current directory."
        exit 1
    fi
done

# Run the Ansible playbook
echo "Running Ansible playbook..."
ansible-playbook setup.yml

echo "Setup completed."

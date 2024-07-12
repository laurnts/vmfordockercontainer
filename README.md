# Ubuntu VM Setup Playbook

This Ansible playbook automates the setup of an Ubuntu VM with Docker, enhanced security settings, and useful tools. It's designed to be idempotent and can be rerun for updates.

```
Add public key within setup.yml
```

## Features

- Updates and upgrades system packages
- Configures system settings (sysctl)
- Sets up SSH with secure configurations
- Installs and configures Docker
- Installs Docker Compose and Python SDK for Docker
- Sets up UFW (Uncomplicated Firewall) with Docker integration
- Configures unattended upgrades
- Installs ctop for Docker container monitoring
- Generates SSH key for root user

## Requirements

- Ubuntu target system (tested on Ubuntu 20.04 LTS and newer)
- Ansible 2.9 or newer on the control machine
- SSH access to the target system with sudo privileges

## Usage

1. Clone this repository:
   ```
   git clone git@github.com:laurnts/vmfordockercontainer.git
   ```

2. Review and adjust variables in `setup.yml` if needed, particularly:
   - `project_user`
   - `ssh_public_key`
   - `security_*` variables for SSH configuration
   - `ctop_version`

3. Ensure you have the following files in the same directory:
   - `setup.yml` (the main playbook)
   - `20auto-upgrades.j2`
   - `50unattended-upgrades.j2`

4. Run the playbook:
   ```
   sudo ansible-playbook setup.yml
   ```

## What This Playbook Does

1. Updates and upgrades all system packages
2. Configures sysctl settings for better performance
3. Sets up SSH with custom security configurations
4. Installs and configures Docker and Docker Compose
5. Sets up UFW and integrates it with Docker
6. Configures unattended upgrades for automatic system updates
7. Installs ctop for Docker container monitoring
8. Generates an SSH key for the root user

## Customization

You can customize this playbook by modifying the variables in the `vars` section of `setup.yml`. Key areas you might want to adjust include:

- SSH configuration
- Docker daemon settings
- Packages to be installed
- UFW rules
- Unattended upgrade settings

## Rerunning for Updates

This playbook is designed to be idempotent. You can rerun it at any time to update your system and ensure all configurations are up to date:

```
sh install.sh
```
or
```
ansible-playbook setup.yml
```
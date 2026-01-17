# Minimal Ubuntu VM Setup with Docker

Ansible playbook to setup an Ubuntu VM with Docker. Runs on localhost, idempotent and rerunnable.

## Features

- System packages update and upgrade
- SSH configuration (port, user, key-based auth)
- Docker CE with Compose v2 plugin
- UFW firewall with Docker integration
- Fail2ban for SSH protection
- Unattended security upgrades
- Command history tracking
- Log rotation

## Quick Start

```bash
git clone git@github.com:laurnts/vmfordockercontainer.git
cd vmfordockercontainer
cp group_vars/all.example.yml group_vars/all.yml  # Create your config
nano group_vars/all.yml  # Edit configuration
sh install.sh
```

Or run directly:

```bash
ansible-playbook playbook.yml
```

## Configuration

Edit `group_vars/all.yml`:

```yaml
# Default: root user, port 22
server_port: 22
server_user: root

# Custom user example:
server_port: 1234
server_user: user
server_user_password: ""              # Empty = auto-generate
server_hostname: "myserver"
server_timezone: "Europe/Amsterdam"
security_ssh_permit_root_login: "no"
security_ssh_password_authentication: "no"
security_ssh_key: "ssh-rsa AAAA... user@laptop"
```

**Note:** If disabling root login and password auth, you must provide `security_ssh_key`.

## Requirements

- Ubuntu/Debian with sudo
- Ansible (installed by `install.sh`)
- python3-passlib (installed by `install.sh`, required for password hashing)

## Output

When creating a non-root user, credentials are displayed at the end:

```
============================================
USER CREDENTIALS (save this securely!)
============================================
Username: user
Password: GeneratedPassword123
SSH Port: 1234

Login command:
  ssh user@<server_ip> -p 1234
============================================
```

## License

Open source.

#!/bin/bash

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install ansible
elif [[ -f /etc/debian_version ]]; then
    # Debian/Ubuntu
    sudo apt update
    sudo apt install -y ansible
elif [[ -f /etc/redhat-release ]]; then
    # Fedora/CentOS/RHEL
    sudo dnf install -y ansible
else
    echo "Unsupported OS. Please install Ansible manually."
    exit 1
fi

echo "Ansible installed. Running playbook..."
ansible-playbook ~/dotfiles/ansible/playbooks/main.yml

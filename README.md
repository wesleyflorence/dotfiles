# Ansible-managed Dotfiles

This repository contains my personal dotfiles managed with Ansible. It's designed to quickly set up a new system or keep existing systems in sync.

## Repository Structure

```
~/dotfiles/
├── ansible/
│   ├── playbooks/
│   │   └── main.yml
│   ├── roles/
│   │   └── common/
│   │       └── tasks/
│   │           └── main.yml
│   ├── inventory/
│   │   └── hosts
│   └── ansible.cfg
├── config/
│   └── fish/
│       └── config.fish
├── scripts/
│   └── bootstrap.sh
├── README.md
└── .gitignore
```

## Getting Started

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```

2. Run the bootstrap script:
   ```
   ~/dotfiles/scripts/bootstrap.sh
   ```

   This script will install Ansible if it's not already installed, then run the main Ansible playbook.

## Common Ansible Commands

Here are some useful Ansible commands for managing your dotfiles:

1. Run the main playbook:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml
   ```

2. Run the playbook with verbose output:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml -v
   ```

3. Run only tasks tagged with a specific tag:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml --tags "config"
   ```

4. Run the playbook, skipping tasks with a specific tag:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml --skip-tags "packages"
   ```

5. Check what changes would be made without actually making them:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml --check
   ```

6. Run the playbook for a specific host:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml -l specific_host
   ```

7. Run the playbook with a specific variable:
   ```
   ansible-playbook ~/dotfiles/ansible/playbooks/main.yml -e "variable_name=value"
   ```

## Customization

- Modify `ansible/playbooks/main.yml` to add or remove tasks.
- Add new roles in the `ansible/roles/` directory for organizing related tasks.
- Update `config/fish/config.fish` to customize your Fish shell configuration.
- Add new configuration files to the `config/` directory and create corresponding tasks in your Ansible playbooks to manage them.

## Troubleshooting

If you encounter any issues:

1. Check the Ansible output for error messages.
2. Run the playbook with increased verbosity (`-v`, `-vv`, or `-vvv`) for more detailed output.
3. Ensure all paths in your playbooks and tasks are correct.
4. Verify that you have the necessary permissions to perform the tasks.

Remember to keep this README updated as you modify your dotfiles setup!

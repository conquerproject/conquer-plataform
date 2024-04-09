# Ansible Structure

This repository contains an Ansible structured as follows:

ansible
├── ansible.cfg           # Ansible configuration file

├── inventory             # Directory containing inventory files for different environments
│   ├── dev
│   │   ├── group_vars    # Directory for group variables specific to the development environment
│   │   │   └── all.yaml  # Group variables file for all hosts in the development environment
│   │   └── hosts.yml     # Inventory file for hosts in the development environment
│   └── prod
│       ├── group_vars    # Directory for group variables specific to the production environment
│       │   └── all.yaml  # Group variables file for all hosts in the production environment
│       └── hosts.yml     # Inventory file for hosts in the production environment

├── playbooks             # Directory for storing Ansible playbooks

└── roles                 # Directory for organizing Ansible roles
    └── role-sample       # Sample role directory
        ├── defaults      # Directory for default variables for the role
        ├── files         # Directory for static files to be copied to the hosts
        ├── handlers      # Directory for handler tasks associated with the role
        ├── tasks         # Directory for main tasks associated with the role
        ├── templates     # Directory for Jinja2 templates used by the role
        └── vars          # Directory for variables specific to the role

## Configuration Details

- **ansible.cfg**: This file contains the global settings for Ansible, such as the default inventory file path, roles path, and other Ansible behaviors.

- **inventory/**: This directory holds the inventory files, organized by environment (e.g., `dev`, `prod`). Each environment directory contains a `hosts.yml` file for defining hosts and a `group_vars/` directory for environment-specific variables.

- **playbooks/**: Here, you'll find the Ansible playbooks that define the tasks to be executed on your hosts. These playbooks can utilize roles defined in the `roles/` directory.

- **roles/**: This directory contains reusable roles that can be applied across different playbooks and projects. Each role includes its own set of tasks, handlers, files, templates, and variables.

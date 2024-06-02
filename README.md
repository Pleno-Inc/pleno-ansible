## Quick start

1. Obtain Ansible either from APT or from Python-PIP

2. Define the list of servers in `hosts.ini`:

```ini
[jupyterhub]
192.168.5.xxx ansible_user=admin

[dev]
192.168.5.xxx ansible_user=admin

[compute]
192.168.5.xxx ansible_user=admin
```

3. (Optional) Comment out unwanted servers in `main.yml`.

4. Execute `ansible-playbook -i hosts.ini -Kk main.yml` to deploy services.

## Directory structure

https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#directory-layout

## How to contribute

1. Install `ansible-lint` via APT or Python-PIP

2. Create a new "service" by creating the following folder structure in `roles/` folder

```
roles/
> new_service/
  > tasks/main.yml
  > files/
  > defaults/main.yml
```

3. Convert the service deployment instructions on Confluence to Ansible domain specific language in `roles/new_service/tasks/main.yml`.

4. Run `ansible-lint main.yml` to flush out bugs.

5. Submit the pull request on Github.


## Ansible best practices

The best directory structure for an Ansible repository with playbooks and roles depends on the size and complexity of your environment. However, a commonly recommended structure is:
Top-level directories

    inventories/: Contains inventory files for different environments (e.g. production, staging)
    group_vars/: Contains group variable files
    host_vars/: Contains host variable files
    roles/: Contains all roles
    playbooks/: Contains playbook files

Roles directory structure
Each role should have the following subdirectories:

    tasks/: Contains main.yml file with tasks for the role
    handlers/: Contains main.yml file with handlers for the role
    templates/: Contains Jinja2 templates
    files/: Contains files to be copied
    vars/: Contains role variables
    defaults/: Contains default variables
    meta/: Contains role dependencies


```
ansible-repo/
├── inventories/
│   ├── production/
│   │   ├── hosts
│   │   ├── group_vars/
│   │   └── host_vars/
│   └── staging/
│       ├── hosts
│       ├── group_vars/
│       └── host_vars/
├── group_vars/
│   ├── all.yml
│   ├── webservers.yml
│   └── dbservers.yml
├── host_vars/
│   ├── db1.yml
│   └── web1.yml
├── roles/
│   ├── common/
│   ├── webserver/
│   └── database/
└── playbooks/
    ├── site.yml
    ├── webservers.yml
    └── dbservers.yml
```
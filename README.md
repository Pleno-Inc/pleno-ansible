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
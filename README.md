# ansible-role-webkiosk

[![GitHub latest release](https://img.shields.io/github/v/release/dmotte/ansible-role-webkiosk?logo=github&style=flat-square)](https://github.com/dmotte/ansible-role-webkiosk/actions)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-dmotte.webkiosk-blueviolet?logo=ansible&style=flat-square)](https://galaxy.ansible.com/dmotte/webkiosk)

Ansible role to turn your _Linux_ device into a **web kiosk** (i.e. a device whose sole purpose is to display a web page and consent minimal user interaction). This can sometimes be useful e.g. to display information on a large screen or something like that.

:information_source: To make the system as lightweight as possible, only **Xorg** and a full-screen **Chromium** browser instance are started. **No window manager** needed! :slightly_smiling_face:

This role has been tested with **Debian 11** (_bullseye_).

## Usage

1. Install this role using the `ansible-galaxy` CLI tool
2. You can then include it into the `tasks` section of your _Ansible Playbook_. See [`test/playbook.yml`](test/playbook.yml) for an example of how to do that. Remember to replace the role name with `dmotte.webkiosk`.

> **Note**: this role must be run as root (`ansible_become: true`).

### Role variables

| Variable | Description                             |
| -------- | --------------------------------------- |
| `url`    | URL of the web kiosk browser start page |

## Development

If you want to contribute to this project, you can use the [`test/playbook.yml`](test/playbook.yml) file to test the role while editing it.

Place your inventory file (e.g. `hosts.yml`) inside the `test` folder.

Edit the `vars` section of the [`test/playbook.yml`](test/playbook.yml) file to match your scenario.

You can then **execute the playbook** against your host:

```bash
cd test/
ansible-playbook -i hosts.yml playbook.yml
```

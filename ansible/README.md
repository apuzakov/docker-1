Ansible
=======

This is a base docker image for running Ansible Playbooks during a Docker build.

* The image is build from code from the ansible git repository.
* The image not meant to be run standalone and provides no CMD / ENTRYPOINT

Usage
-----

* Set `hosts: localhost` in your playbook
* Run the playbook as following:

```
ADD playbook /playbook/
RUN \
 cd /playbook && \
 /opt/ansible/bin/ansible-playbook -c local site.yml
```


Variables
---------

Here a description of environment variables for configuring the ansible build.

| Variable        | Description                 | Example             | Default                     |
|-----------------|-----------------------------|---------------------|-----------------------------|
| ANSIBLE_VERSION | Which code branch to build. | `--branch v1.9.1-1` | Latest (no specific branch) |

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

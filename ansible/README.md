Ansible
=======

This is a base docker image containing Ansible.

* The image is build from code from the ansible git repository.
* The image is meant to be a base image and thus provides no CMD / ENTRYPOINT

Variables
---------

Here a description of environment variables for configuring the ansible build.

| Variable        | Description                 | Example             |
|-----------------|-----------------------------|---------------------|
| ANSIBLE_VERSION | Which code branch to build. | `--branch v1.9.1-1` |

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

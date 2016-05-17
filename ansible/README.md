Ansible
=======

Run Ansible from this Docker container instead of installing Ansible on your machine.

Usage
-----

* If you deploy to `localhost`, you playbook must not override the `localhost`

Run

```
docker run -it --rm -v "/path/to/ansible-artifacts":/ansible -v "$(echo $HOME)/.ssh/id_rsa":/root/.ssh/id_rsa thomass/ansible bash
```

Then change the directory to `/ansible` and execute your playbook with `--extra-vars "ansible_ssh_user=yourname"`, where `yourname` is your login name to your host machine.

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

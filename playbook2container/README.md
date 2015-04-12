# info

The playbook _playbook2container_ allows to automatically execute another playbook within a docker container. This project isn't finished yet. At present mapped ports of the container must be adjusted in the _playbook2container.yml_, theplaybook to execute within the container must be named container_tasks/tasks.yml and may only contain tasks.

# howto

Modify the tasks to be executed within the container inside the _container_tasks/tasks.yml_ and run following commands:

```
export ANSIBLE_HOST_KEY_CHECKING=False
sudo ansible-playbook aptupdate.yml
```

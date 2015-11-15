# Ansible-Target
This is a Docker Image whose containers could be used as Ansible targets. Python is installed and an SSH-Server is waiting for incoming requests on Port 22.

## Usage

```
docker run --name target -p 2222:22 thomass/ansible-target
```

Now Ansible could connect to this container via `localhost:22`. You have two ways to authenticate via public key with the container. First you can use the private key provided by the container:

```
d exec target printPrivateKey > container.key
ssh -p 2222 -i container.key root@localhost

```

Second you could inject your public key into the container:

```
d exec -i target readPublicKey < ~/.ssh/id_rsa.pub
ssh -p 2222 root@localhost
```

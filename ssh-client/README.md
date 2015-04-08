# Description

This container could be used as replacement for the installable ssh-client package.

# Examples

## Create a data volume container with private and public key

```docker run -it --name sshdata thomass/ssh-client ssh-keygen -t rsa -C "username@machinename"```

## Create private/public key in another container

```
docker create --name another_container -v /root/.ssh ubuntu
docker run -it --rm --volumes-from another_container thomass/ssh-client ssh-keygen -t rsa -C "username@machinename"
```

## Copy public key from another container to authorized_key file on server

```
docker run -it --rm --volumes-from another_container thomass/ssh-client ssh-copy-id -p port <user>@<server-ip>
```

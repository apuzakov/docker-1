This image runs plain unison as entrypoint. It is adviced to create external docker volume containers for:

* /path/to/data - the destination of the sync
* /root/.ssh - the ssh key
* /root/.unison - the unison working data

If you create a _default.prf_ in the working directory of unison, the docker container would not need any further options and running those default settings.

# setup

## create a data volume container for the data to synchronize

```
sudo docker create -v /path/to/data --name synceddata ubuntu
```

## create a data volume container for the ssh key

... and register the key on the remote server

```
sudo docker run -it --name sshdata thomass/ssh-client ssh-keygen -t rsa -C "key for docker unison"
sudo docker run -it --rm --volumes-from sshdata thomass/ssh-client ssh-copy-id [-p <remote-port>] [<user>@]<remote-ip>
```

## create a data volume container for all unison data

```
sudo docker create --name unisondata --volumes-from synceddata --volumes-from sshdata -v /root/.unison ubuntu
```

## setup the default sync profile

```
sudo docker run -it --rm --volumes-from unisondata ubuntu vim.tiny /root/.unison/default.prf
```

Insert following (example) settings

```
root = /path/to/data
root = ssh://[<user>@]<remote-ip>[:<remote-port>]//path/to/data
```

# usage

Now you can run a synchronization any time as following

```
sudo docker run -it --rm --volumes-from unisondata thomass/unison
```

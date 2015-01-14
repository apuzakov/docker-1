# setup

## create a data volume container for the data to synchronize

```
sudo docker run -d -v /path/to/data --name synceddata ubuntu echo Data-only container
```

## create a data volume container for the ssh key

... and register the key on the remote server

```
sudo docker run -it --name sshdata ssh-client ssh-keygen -t rsa -C "key for docker unison"
sudo docker run -it --rm --volumes-from sshdata ssh-client ssh-copy-id [-p <remote-port>] [<user>@]<remote-ip>
```

## create a data volume container for all unison data

```
sudo docker run -d --name unisondata --volumes-from synceddata --volumes-from sshdata -v /root/.unison ubuntu
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

Now you can run a synchronization as following

```
sudo docker run -it --rm --volumes-from unisondata thomass/unison
```

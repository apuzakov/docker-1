# setup

## create a data volume container for the data to synchronize

```
sudo docker run -d -v /path/to/data --name unisondata ubuntu echo Data-only container
```

## create a data volume container for unison setup data

```
sudo docker run -it --volumes-from unisondata thomass/unison bash
```

There you can first register your ssh key on the remote server

# mandatory volumes

* /root/.unison
* /root/.ssh

Those volume should be maintained in a separate data volume container

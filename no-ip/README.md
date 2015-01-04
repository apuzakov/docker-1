This container is running the noip.com DUC client for updating your DynDN.

# Usage

First time start the container interactively to setup noip.com credentials:

```
sudo docker run -it --rm --name noip thomass/no-ip
```

Then you can start the permanent DUC process this way:

```
sudo docker start noip
```

This container is permanently calling the euserv DDNS server updating your IP

# Usage

```
sudo docker run -d -e AUTTH=<yourEuservAuthHash> --name euserv drsarez/euserv-ddns
```

# environment variables

* SERVER    = (optional) the URL of the DDNS Server (default = 'https://ddns.euserv.org')
* AUTHHASH  = (mandatory) the authentication hash (no default)
* INTERVAL  = (optional) the update time in seconds (default = 310)

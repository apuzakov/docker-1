euserv-ddns
===========

This container is permanently calling the euserv DDNS server updating your IP

Usage
-----

```
sudo docker run -d -e AUTHHASH=<yourEuservAuthHash> --name euserv thomass/euserv-ddns
```

Environment Variables
---------------------

| Variable | Usage     | Description                | Default                  |
|----------|-----------|----------------------------|--------------------------|
| SERVER   | optional  | The URL of the DDNS Server | https://ddns.euserv.org  |
| AUTHHASH | mandatory | The authentication hash    | no default               |
| INTERVAL | optional  | The update time in seconds | 310                      |

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

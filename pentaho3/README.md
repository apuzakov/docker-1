pentaho3
========

This container is running the Community Edition of Pentaho 3.9.

Usage
-----

```
sudo docker run -d --name pentaho -p 8081:8080 -p 8099:8099 thomass/pentaho3
```

The service is then available on your Docker machine on port 8081,
e.g. http://localhost:8081 . The administration console is available on
port 8099.

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

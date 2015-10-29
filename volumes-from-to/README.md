# thomass/volumes-from-to
This image is for easy mapping `--volumes-from` a data volume container to another path.

## usage
Imagine following data volume container is given:

```
docker create --name data -v /var/foo busybox
```

So you want this volume but under the path _/srv/foo_. Now you can do this:

```
docker run --name datamap --volumes-from data -v /srv thomass/volumes-from-to "/var/foo:/srv/foo"
```

Mention that you just create the parent folder of the mapped path as volume! Finally you can gather the mapped volume as follows:

```
docker run -it --rm --name test --volumes-from datamap ubuntu bash
```

## drawbacks
- Both volumes, the mapped ones and the original volumes, become mounted.
  - as in the example _/var/foo_ and _/srv/foo_ become mounted in the test container

- The mapping is a simple symbolic link from _/srv/foo_ --> _/var/foo_. Consider this as some programs would handle symbolic links different.

## further knowledge
You also can map multiple paths with one call:

```
docker create --name data -v /var/foo -v /var/bar -v /var/awesome busybox
docker run --name datamap --volumes-from data -v /srv -v /this/is thomass/volumes-from-to "/var/foo:/srv/foo::/var/bar:/srv/bar::/var/awesome:/this/is/awesome"
```

## Licence
The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

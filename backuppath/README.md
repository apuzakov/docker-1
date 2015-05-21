Docker Backup Paths
===================

This is a docker image for making fast and easy backups of other docker containers volumes.

* The archive is compressed with 7zip
* The name of created backups has the pattern _yyyy-MM-dd-backup.tar.7z_
* During restore all files inside the originally archived paths will be deleted to clear files not in the archive.

Usage
-----

__Backup:__

```
sudo docker run --rm \
 --volumes-from my_volume \
 -v /host/backup/path:/backup \
 -e SOURCE=/data/volume/path \
 thomass/backuppath backup
```

* `my_volume` - the name of the data volume container
* `/host/backup/path` - the path on your host where the backup would be stored
* `/data/volume/path` - the path within the data volume container to backup
 * multiple paths could be separated by colon: `/my/path:/your/path:/her/path`

__Restore:__

```
sudo docker run --rm \
 --volumes-from my_volume \
 -v /host/backup/path:/backup \
 -e SOURCE=2015-05-13_backup.tar.7z \
 thomass/backuppath restore
```

* `2015-05-13_backup.tar.7z` - the file created during the backup to restore

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

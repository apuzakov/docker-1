This is a docker image for making fast and easy backups of docker data volumes.

Usage
-----

__Backup:__

```
sudo docker run --rm --volumes-from my_volume -v /host/backup/path:/backup -e SOURCE=/data/volume/path thomass/backuppath backup
```

1. `my`volume` - the name of the data volume container
1. `/host/backup/path` - the path on your host where the backup would be stored
1. `/data/volume/path` - the path within the data volume container to backup
  1. multiple paths shoulde be separated by colon: `/my/path:/your/path:/her/path`

__Restore:__

```
sudo docker run --rm --volumes-from my_volume -v /host/backup/path:/backup -e SOURCE=2015-05-13_backup.tar.7z thomass/backuppath restore
```

1. `my_volume` - the same like during the backup
1. `/host/backup/path` - the same like during the backup
1. `2015-05-13_backup.tar.7z` - the file created during the backup to restore

This is a docker image for making fast and easy backups of dockerized mysql databases.

Backup/Restore Types
--------------------

__Remote:__ All operations will be directly executed on the remote mysql database running in the foreign container.

__Local:__ The mysql datadir _/var/lib/mysql_ will be copied from the remote container and used within an own mysql instance. The foreign container (database) must be - and also can be - stopped.

Usage
-----

__Backup:__

_Remote Backup:_

```
sudo docker run --rm \
 --link mysql_server:mysqlserver \
 -v /host/backup/dir:/backup \
 -e DBUSER=root \
 -e DBPASS=mysecret \
 -e DATABASE=mydatabase \
 thomass/mysqldump backup
```

1. `mysql_server` - the container the mysql server is running in
1. `/host/backup/path` - the path on your host where the backup would be stored

_Local Backup:_

Just replace the __--link left:right__ option with the __--volumes-from left__ option.

__Restore:__

_Remote Restore:_

```
sudo docker run --rm \
 --link mysql_server:mysqlserver \
 -v /host/backup/dir:/backup \
 -e DBUSER=root \
 -e DBPASS=mysecret \
 -e SOURCE=2015-05-13.sql.7z \
 thomass/mysqldump restore
```

1. `mysql_server` - the same like during the backup
1. `/host/backup/path` - the same like during the backup
1. `2015-05-13.sql.7z` - the file created during the backup to restore

_Local Restore:_

As with local backup, just replace the __--link left:right__ option with the __--volumes-from left__ option.

__Predefined variables:__

The default _DBUSER_ is _root_ and by default all databases becomes backuped, such that both commands could be shortened as follows:

```
sudo docker run --rm --link mysql_server:mysqlserver \
 -v /host/backup/dir:/backup -e DBPASS=mysecret thomass/mysqldump backup
 
sudo docker run --rm --link mysql_server:mysqlserver \
 -v /host/backup/dir:/backup -e DBPASS=mysecret -e SOURCE=2015-05-13.sql.7z thomass/mysqldump restore
```

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

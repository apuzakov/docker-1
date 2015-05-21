Docker mysqldump
================

This is a docker image for making fast and easy backups of dockerized mysql databases.

Backup/Restore Types
--------------------

__Remote:__ All operations will be directly executed on the remote mysql database running in the foreign container.

__Local:__ The mysql datadir _/var/lib/mysql_ will be copied from the remote container and used within an own mysql instance. The foreign container (database) must be - and also can be - stopped.

All following examples show _local_ operations. To swith to _remote_ operations just replace `--volumes-from mysql_server` with `--link mysql_server:mysqlserver`.

Usage
-----

__Backup:__

```
sudo docker run --rm \
 --volumes-from mysql_server \
 -v /host/backup/dir:/backup \
 -e DBUSER=root \
 -e DBPASS=mysecret \
 -e DATABASE=mydatabase \
 thomass/mysqldump backup
```

* `mysql_server` - the container the mysql server is running in
* `/host/backup/path` - the path on your host where the backup would be stored

__Restore:__

```
sudo docker run --rm \
 --volumes-from mysql_server \
 -v /host/backup/dir:/backup \
 -e DBUSER=root \
 -e DBPASS=mysecret \
 -e SOURCE=2015-05-13.sql.7z \
 thomass/mysqldump restore
```

* `mysql_server` - the same like during the backup
* `/host/backup/path` - the same like during the backup
* `2015-05-13.sql.7z` - the file created during the backup to restore

__Predefined variables:__

The default _DBUSER_ is _root_ and by default all databases becomes backuped, such that both commands could be shortened as follows:

```
sudo docker run --rm --volumes-from mysql_server \
 -v /host/backup/dir:/backup -e DBPASS=mysecret thomass/mysqldump backup
 
sudo docker run --rm --volumes-from mysql_server \
 -v /host/backup/dir:/backup -e DBPASS=mysecret -e SOURCE=2015-05-13.sql.7z thomass/mysqldump restore
```

Licence
-------

The whole repository is licenced under BSD. Please mention following:

github.com/ThomasSteinbach (thomass at aikq.de)

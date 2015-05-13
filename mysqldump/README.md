This is a docker image for making fast and easy backups of dockerized mysql databases.

Usage
-----

__Backup:__

```
sudo docker run --rm --link mysql_server:mysqlserver -v /host/backup/dir:/backup -e DBUSER=root -e DBPASS=mysecret -e DATABASE=mydatabase thomass/mysqldump backup
```

1. `mysql_server` - the container the mysql server is running in
1. `/host/backup/path` - the path on your host where the backup would be stored

__Restore:__

```
sudo docker run --rm --link mysql_server:mysqlserver -v /host/backup/dir:/backup -e DBUSER=root -e DBPASS=mysecret -e SOURCE=2015-05-13.sql.7z thomass/mysqldump restore
```

1. `mysql_server` - the same like during the backup
1. `/host/backup/path` - the same like during the backup
1. `2015-05-13.sql.7z` - the file created during the backup to restore

__Predefined variables:__

The default _DBUSER_ is _root_ and by default all databases becomes backuped, such that both commands could be shortened as follows:

```
sudo docker run --rm --link mysql_server:mysqlserver -v /host/backup/dir:/backup -e DBPASS=mysecret thomass/mysqldump backup
sudo docker run --rm --link mysql_server:mysqlserver -v /host/backup/dir:/backup -e DBPASS=mysecret -e SOURCE=2015-05-13.sql.7z thomass/mysqldump restore
```

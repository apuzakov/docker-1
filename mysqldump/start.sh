#!/bin/bash

function backup(){
  backupfile="/backup/$(date '+%Y-%m-%d').sql.7z"
  rm "${backupfile}"
  if [[ -z ${DATABASE} ]]
    then mysqldump -h mysqlserver -u ${DBUSER:-root} --password=${DBPASS} --max_allowed_packet=512m --add-drop-database --all-databases | 7zr a -si "${backupfile}"
    else mysqldump -h mysqlserver -u ${DBUSER:-root} --password=${DBPASS} --max_allowed_packet=512m --add-drop-database --databases ${DATABASE} | 7zr a -si "${backupfile}"
  fi
  chown -R user1000:user1000 /backup
}

function restore(){
  7zr x -so "/backup/${SOURCE}" | mysql -h mysqlserver -u ${DBUSER:-root} --password=${DBPASS}
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

#!/bin/bash

BACKUP_DIR="/backup"

function backup(){
  backupfile="${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  rm "${backupfile}"
  tar cf - "${SOURCE[@]}" | 7zr a -si "${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  chown -R user1000:user1000 "${BACKUP_DIR}"
}

function restore(){
  7zr x -so "${BACKUP_DIR}/${SOURCE}" | tar --same-owner -pxf - -C /
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

#!/bin/bash

DESTINATION="/backup"

function backup(){
  backupfile="${DESTINATION}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  rm "${backupfile}"
  tar cf - "${SOURCE[@]}" | 7zr a -si "${DESTINATION}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  chown -R user1000:user1000 "${DESTINATION}"
}

function restore(){
  7zr x -so "${SOURCE}" | tar --same-owner -pxf - -C /
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

#!/bin/bash

SOURCE=(${SOURCE//:/ })
BACKUP_DIR="/backup"
BASEDIR=$(dirname $0)

cd "${BASEDIR}"

function backup(){
  echo "BACK IT UP"
  backupfile="${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  rm "${backupfile}"
  tar cf - "${SOURCE[@]}" | 7zr a -si "${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  chown -R user1000:user1000 "${BACKUP_DIR}"
}

function restore(){
  echo "RE STORE"
  7zr e "${BACKUP_DIR}/${SOURCE}" -o/tmp/backup
  # remote previous directories
  echo "remove: "
  tar tf /tmp/backup/*.tar | python tarpaths.py
  rm -rf "$(tar tf /tmp/backup/*.tar | python tarpaths.py)*"
  tar --same-owner -C / -pxf /tmp/backup/*.tar
  rm -rf /tmp/backup
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

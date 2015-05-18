#!/bin/bash

# split sources by ':' into an array
SOURCE=(${SOURCE//:/ })
BACKUP_DIR="/backup"
# get the working dir of the script
BASEDIR=$(dirname $0)

cd "${BASEDIR}"

function backup(){
  echo "BACK IT UP"
  backupfile="${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  if [[ -f "${backupfile}" ]]
  then rm "${backupfile}"
  fi
  tar cf - "${SOURCE[@]}" | 7zr a -si "${BACKUP_DIR}/$(date '+%Y-%m-%d')_${NAME:-backup}.tar.7z"
  chown -R user1000:user1000 "${BACKUP_DIR}"
}

function restore(){
  echo "RE STOREs"
  if [[ -f "${BACKUP_DIR}/${SOURCE}" ]]
  then
    7zr e "${BACKUP_DIR}/${SOURCE}" -o/tmp/backup
    # remote previous directories
    echo "remove: "
    tar tf /tmp/backup/*.tar | python tarpaths.py
    rm -rf $(tar tf /tmp/backup/*.tar | python tarpaths.py)
    tar --same-owner -C / -pxf /tmp/backup/*.tar
    rm -rf /tmp/backup
  else
    echo "No such file: ${BACKUP_DIR}/${SOURCE}"
  fi
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

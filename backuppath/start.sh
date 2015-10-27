#!/bin/bash

# split sources by ':' into an array
SOURCE=(${SOURCE//:/ })
BACKUP_DIR="/backup"
# get the working dir of the script
BASEDIR=$(dirname $0)

cd "${BASEDIR}"

function backup(){
  echo "Backup: ${PATHS[@]}"
  backupfile="${BACKUP_DIR}/${BACKUP_NAME:-backup}.tar.7z"
  if [[ -f "${backupfile}" ]]
    then rm "${backupfile}"
  fi
  tar cf - "${PATHS[@]}" | 7zr a -si "${backupfile}"
  chown -R user1000:user1000 "${BACKUP_DIR}"
  echo "Backup created in $backupfile"
}

function restore(){
  echo "Restore backup ${BACKUP_DIR}"
  if [[ ! -z $(ls "${BACKUP_DIR}"/${BACKUP_NAME} 2>/dev/null) ]]
  then
    7zr e "${BACKUP_DIR}"/${BACKUP_NAME} -o/tmp/backup
    # remove previous directories
    echo "Clear and restore paths contained in archive: "
    tar tf /tmp/backup/*.tar | python tarpaths.py
    rm -rf $(tar tf /tmp/backup/*.tar | python tarpaths.py)
    tar --same-owner -C / -pxf /tmp/backup/*.tar
    rm -rf /tmp/backup
  else
    echo "No such backup file: ${BACKUP_DIR}/${BACKUP_NAME}"
  fi
}

if [[ $1 = "backup" ]]
   then backup
elif [[ $1 = "restore" ]]
  then restore
  else echo "Call with 'backup' or 'restore'"
fi

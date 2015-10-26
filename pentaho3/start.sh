#!/bin/bash
echo -ne '\n' | /home/pentaho/biserver-ce/start-pentaho.sh
cd /home/pentaho/administration-console
./start-pac.sh

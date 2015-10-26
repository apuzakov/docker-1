#!/bin/bash
echo -ne '\n' | /home/pentaho/biserver-ce/start-pentaho.sh
sleep 2
tail -f /home/pentaho/biserver-ce/tomcat/logs/catalina.out

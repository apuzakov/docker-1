#!/bin/bash
/etc/init.d/sogo start
tail -f /var/log/sogo/sogo.log

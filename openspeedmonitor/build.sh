#!/bin/bash
i=0
while [[ -z $(ls target/*.war 2>/dev/null) ]] && [[ $i -lt 5 ]]
do
  i=$((i+1))
  ./grailsw war
done

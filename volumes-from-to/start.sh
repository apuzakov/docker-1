#!/bin/bash
PAIRS=(${1//::/ })

function linkPaths(){
  paths=(${1//:/ })
  echo "Link ${paths[1]} to ${paths[0]}"
  ln -s "${paths[0]}" "${paths[1]}"
}

for link_pair in "${PAIRS[@]}"
do
  linkPaths "$link_pair"
done

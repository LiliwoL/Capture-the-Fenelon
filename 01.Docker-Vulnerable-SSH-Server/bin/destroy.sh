#!/usr/bin/env bash

# Echo with figlet if exists
if type "figlet" > /dev/null; then
  figlet "Destruction des images"
else
  echo "Destruction des images"
fi

docker rmi $(docker images 'ctf/01-ctf-openssh-server')
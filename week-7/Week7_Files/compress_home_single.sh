#!/bin/bash
# Implementasi oleh Christopher Samuel

HOME="/home"

cd $HOME

USERS=$( awk -F':' '{ print $1 }' /etc/passwd )
COLLECTIVE_HOME_DIRS=""


while read USERNAME
do
        if [ -d "$USERNAME" ]
        then
                FILENAME="/var/backups/$USERNAME.tar.gz"
                sudo tar -czvf $FILENAME $HOME/$USERNAME
        fi
done <<< $USERS

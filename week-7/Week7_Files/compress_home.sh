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
                if [ -z "$COLLECTIVE_HOME_DIRS" ]
                then
                        COLLECTIVE_HOME_DIRS="$HOME/$USERNAME"
                else
                        COLLECTIVE_HOME_DIRS="$COLLECTIVE_HOME_DIRS $HOME/$USERNAME"
                fi
        fi
done <<< $USERS

sudo tar -czvf /var/backups/home_dirs.tar.gz $COLLECTIVE_HOME_DIRS

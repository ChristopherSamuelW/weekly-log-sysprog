#!/bin/bash
# Implementasi oleh Christopher Samuel

HOME_DIR="/home"
SSH_DIR=".ssh"

cd $HOME_DIR

USERS=$( awk -F':' '{ print $1 }' /etc/passwd )

while read USERNAME
do
        if [ -d "$USERNAME" ]
        then
                cd $USERNAME;
                if [ ! -d "$SSH_DIR" ]
                then
                        mkdir $SSH_DIR;
                else
                        CURRENT_DIR=$( pwd )
                        echo "$USERNAME $SSH_DIR folder in $CURRENT_DIR/$SSH_DIR"
                fi
                cd ..
        fi

done <<< $USERS

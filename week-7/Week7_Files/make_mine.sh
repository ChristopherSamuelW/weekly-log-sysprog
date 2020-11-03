#!/bin/bash
# Implementasi oleh Christopher Samuel

function make_mine() {
        local IN_PATH=$1
        local USER=$2
        cd "$IN_PATH"

        # Ini untuk menghindari match total X dari ls -l. Ini bisa dilakukan
        # karena tidak ada file type yang memiliki char representasi "t"
        local FILE_LIST=$( ls -l | grep ^[^t] )

        while read FILE
        do
                local FILE_ARR=($FILE);
                local FILENAME=${FILE_ARR[8]};

                if [ -z "$FILENAME" ]
                then
                        return 0
                fi

                if [ -d "$FILENAME" ]
                then
                        make_mine "$FILENAME" "$USER";
                        cd ..;
                fi

                sudo chown "$USER" "$FILENAME";

        done <<< "$FILE_LIST"

        return 0
}

if [ ! -z $1 ]
then
        IN_PATH_GLOBAL=$1
        if [ -d  "$IN_PATH_GLOBAL" ]
        then
                make_mine "$IN_PATH_GLOBAL" $( whoami );
        fi
else
        echo Input the path
fi

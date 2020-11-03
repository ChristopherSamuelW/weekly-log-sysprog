#!/bin/bash
# Implementasi oleh : Christopher Samuel
CURRENT_DIR=$( pwd )
echo "Initial Directory = $CURRENT_DIR"
DIR_COUNT=0
 
function tree_dir {
    NEXT_DIR=$1
    cd $NEXT_DIR
    SUBDIRS=$( ls -l | grep ^d )

    if [ -z "$SUBDIRS" ]
    then
        cd ..
        return 0
    fi

    local DEPTH=$2

    while read DIR;
        do
            local LOOP_COUNT=0;
            INDENTATION="";
            while [ $LOOP_COUNT -le $((DEPTH - 1)) ];
                do
                    INDENTATION="$INDENTATION>>> ";
                    LOOP_COUNT=$((LOOP_COUNT + 1));
                done
            DIR_ARR=($DIR);
            DIRNAME=${DIR_ARR[8]};
            if [ -n $DIRNAME ]
            then
                DIR_COUNT=$((DIR_COUNT + 1));
                echo $INDENTATION$DIRNAME;
                NEW_DEPTH=$((DEPTH + 1))
                tree_dir $DIRNAME $NEW_DEPTH
            fi

        done <<< $SUBDIRS

    cd ..
    return 0
}

tree_dir . 0
echo "Total directories = $DIR_COUNT"

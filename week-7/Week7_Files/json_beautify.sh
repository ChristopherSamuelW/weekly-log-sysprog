#!/bin/bash
# Implementasi oleh Christopher Samuel

NEW_JSON=""
JSON_PATH=$1
JSON_FILE=$( cat $1 )
TAB_COUNT=0
WHITESPACE_ALLOWED=0

function add_tabs() {
    TABS=0
    while [ $TABS -lt $TAB_COUNT ]
    do
        NEW_JSON="$NEW_JSON\t";
        TABS=$(( TABS + 1 ))
    done
}

for (( i=0; i<${#JSON_FILE}; i++ ))
do
    CHAR="${JSON_FILE:$i:1}"
    if [ "$CHAR" == "{" ] || [ "$CHAR" == "[" ]
    then
        NEW_JSON="$NEW_JSON$CHAR\n";
        TAB_COUNT=$(( TAB_COUNT + 1 ));
        add_tabs;
    elif [ "$CHAR" == "}" ] || [ "$CHAR" == "]" ]
    then
        NEW_JSON="$NEW_JSON\n";
        TAB_COUNT=$(( TAB_COUNT - 1 ));
        add_tabs;
        NEW_JSON="$NEW_JSON$CHAR";
    elif [ "$CHAR" == "," ]
    then
        NEW_JSON="$NEW_JSON$CHAR\n";
        add_tabs;
    elif [ "$CHAR" == " " ]
    then
        if [ "$WHITESPACE_ALLOWED" -eq 1 ]
        then
            NEW_JSON="$NEW_JSON$CHAR";
        fi
    elif [ "$CHAR" == ":" ]
    then
        if [ "$WHITESPACE_ALLOWED" -eq 1 ]
        then
            NEW_JSON="$NEW_JSON$CHAR";
        else
            NEW_JSON="$NEW_JSON$CHAR ";
        fi
    elif [ "$CHAR" == "\"" ]
    then
        if [ "$WHITESPACE_ALLOWED" -eq 1 ]
        then
            WHITESPACE_ALLOWED=0
        else
            WHITESPACE_ALLOWED=1
        fi
        NEW_JSON="$NEW_JSON$CHAR";
    else
        NEW_JSON="$NEW_JSON$CHAR";
    fi
done

rm -f output.json
touch output.json
echo -e "$NEW_JSON" >> output.json

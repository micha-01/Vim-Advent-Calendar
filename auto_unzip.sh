#!/usr/bin/env bash

### VARIABLES TO CHANGE ###
AUTO_UNZIP=false # FOR AUTOMATIC UNZIPPING
OPEN_ALL_DOORS=false # AUTOMAGICALLY OPEN ALL DOORS

# ---------------------------------------------------------

unzip_repo() {
    # Save current day as integer (e.g. 12) in DAY 
    if [ -z "$1" ]; then
        printf -v DAY '%(%-d)T' -1
    else
        DAY=$1
    fi

    # get base directory of current script
    REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) 
    cd $REPO_DIR

    # get current password
    PW_FILE="$REPO_DIR/passwords.md"
    DAY_WITH_DOT="$DAY."
    PASSWORD=$(cat $PW_FILE | awk -v with_dot="$DAY_WITH_DOT" 'with_dot == $1 { print $2 }')

    # unzip current door
    CUR_DOOR="$REPO_DIR/Door_$DAY.zip"
    if [[ $PASSWORD ]];then
        unzip -P $PASSWORD $CUR_DOOR
    fi
}

open_all_doors() {
    AUTO_UNZIP=true
    for ((i = 1; i < 25; i++)); do
        if [ -d "Door_$i" ]; then
            echo "Skipped Door $i; already exists."
        else
            unzip_repo $i
        fi
    done
}

update_repo() {
    REPO="git@github.com:micha-01/Vim-Calendar.git"
    git pull $REPO main
}

main() {
    update_repo

    if $AUTO_UNZIP; then
        unzip_repo $1
    fi

    if $OPEN_ALL_DOORS; then
        open_all_doors
    fi
    return 0
}

main

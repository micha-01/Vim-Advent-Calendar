#!/usr/bin/env bash

# FOR AUTOMATIC UNZIPPING
AUTO_UNZIP=false # can be true or false

# AUTOMAGICALLY OPEN ALL DOORS
OPEN_ALL_DOORS=false

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
    if $AUTO_UNZIP; then
        update_repo
        unzip_repo $1
    fi

    if $OPEN_ALL_DOORS; then
        update_repo
        open_all_doors
    fi
    return 0
}

main

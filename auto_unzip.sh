#!/usr/bin/env bash

# FOR AUTOMATIC UNZIPPING
AUTO_UNZIP=false # can be true or false


unzip_repo() {
    # Save current day as integer (e.g. 12) in DAY 
    printf -v DAY '%(%-d)T' -1

    # get base directory of current script
    REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) 
    cd $REPO_DIR

    # get current state of repo
    REPO="git@github.com:micha-01/Vim-Calendar.git"
    git pull $REPO main

    # get current password
    PW_FILE="$REPO_DIR/passwords.md"
    DAY_WITH_DOT="$DAY."
    PASSWORD=$(cat $PW_FILE | awk -v with_dot="$DAY_WITH_DOT" 'with_dot == $1 { print $2 }')

    # unzip current door
    CUR_DOOR="$REPO_DIR/Door_$DAY.zip"
    unzip -P $PASSWORD $CUR_DOOR
}


if $AUTO_UNZIP; then
    unzip_repo
fi


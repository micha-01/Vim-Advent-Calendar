#!/usr/bin/env bash

# set CLI arguments
usage() {
    cat <<- EOM
Usage: `basename $0` [OPTION]
Automagically opens the given door or all of them.
options:
    -d, --door [DOOR]       opens the door with the given number         
    -t, --today             opens the current door
    --all                   opens all already available doors
    -h, --help              show this help message and exit
EOM
}

unzip_repo() {
    # Save current day as integer (e.g. 12) in DAY 
    if [ -z "$1" ]; then
        printf -v DAY '%(%-d)T' -1

    # of form 'Door_X'
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

# argument handling
case "$1" in
    -d | --door) unzip_repo $2
        ;;
    -t | --today) unzip_repo
        ;;
    --all) open_all_doors
        ;;
    *) usage
        ;;
esac

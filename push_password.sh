#!/bin/bash

# files and directories
README="README.md"
REPO_DIR="$HOME/Documents/Programming/Vim-Calendar"
PW_FILE="$REPO_DIR/passwords.txt"

# current day and path to current door
printf -v DAY '%(%-d)T' -1 # Save current day as integer (e.g. 12) in DAY 
DOOR="$REPO_DIR/Door_$DAY"

# stage, commit and push to github
cd $REPO_DIR
COMMIT_MSG="Updated $README on day $DAY"
git add "$REPO_DIR/$README" $DOOR
git commit -m "$COMMIT_MSG"
git push -u origin main

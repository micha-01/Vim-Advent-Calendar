#!/bin/bash

README="README.md"
REPO_DIR="$HOME/Documents/Programming/Vim-Calendar"
GIT=$(which git)
printf -v DAY '%(%-d)T\n' -1 # Save current day as integer (e.g. 12) in DAY

cd $REPO_DIR
$GIT add "$REPO_DIR/$README"
$GIT commit -m "Updated $README on day $DAY"
$GIT push -u origin main

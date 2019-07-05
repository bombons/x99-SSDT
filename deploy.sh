#!/usr/bin/env bash

# set -x

RESTORE='\033[0m'
GREEN='\033[00;32m'

echo "${GREEN}deploying updates...${RESTORE}"

# cd into dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR" || exit 1

# Add changes to git.
git add .

# Commit changes.
msg="update, $(date +"%d-%m-%Y %H:%M:%S")"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
echo "${GREEN}pushing with commit: $msg...${RESTORE}"
git push origin master

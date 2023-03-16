#!/bin/bash

source /home/user1/Dest/09/check.sh
source /home/user1/Dest/09/process.sh

if [[ $? -ne 2 ]]
then
    TARGET_PATH="/data/"
    NAME_FILE="metrics.html"
    s21_make_html
fi

#!/bin/bash

source check.sh
source output.sh

if [[ "$#" -ne 6 ]]
then
  echo "ILLEGAL PARAMETERS: enter 6 arguments"
else
    s21_check $1 $2 $3 $4 $5 $6
    if [[ $? -ne 2 ]]
    then
      PATH_TO_FILE=$1
      COUNT_OF_FOLDERS=$2
      LIST_OF_LETTERS=$3
      COUNT_OF_FILES=$4
      LIST_FOR_FILE=$5
      SIZE_OF_FILES=`echo $6 | awk -F "kb" '{print $1}'`
      s21_create
    fi
fi 

#!/bin/bash

function s21_create_folder_name {
  RESULT_FOLDER_NAME=$LIST_OF_LETTERS
  COUNT_LETTERS=${#LIST_OF_LETTERS}
  LAST_LETTER=${LIST_OF_LETTERS:(-1)}

  if [[ $COUNT_LETTERS -lt 4 ]]
  then
    DIFFERENCE=$(( 4 - $COUNT_LETTERS ))
    for (( i=1; i<=$DIFFERENCE; i++ ))
    do
      RESULT_FOLDER_NAME+=$LAST_LETTER  
    done
  fi
    LIST_FOLDER_LETTER+=$LAST_LETTER
    RESULT_FOLDER_NAME+=$LIST_FOLDER_LETTER
    RESULT_FOLDER_NAME+="_"
    RESULT_FOLDER_NAME+=`date +"%d%m%y"`
}

function s21_create_file_name {
  FILE_NAME="`echo $LIST_FOR_FILE | awk -F "." '{ print $1 }'`"
  FILE_TYPE="`echo $LIST_FOR_FILE | awk -F "." '{ print $2 }'`"
  COUNT_FILE_LETTERS=${#FILE_NAME}
  RESULT_FILE_NAME=$FILE_NAME
  LAST_FILE_LETTER=${FILE_NAME:(-1)}
  
  if [[ $COUNT_FILE_LETTERS -lt 4 ]]
  then
    DIFFERENCE_FILE_LETTERS_COUNT=$(( 4 - $COUNT_FILE_LETTERS ))

    for (( i=1; i<=$DIFFERENCE_FILE_LETTERS_COUNT; i++ ))
    do
        RESULT_FILE_NAME+=$LAST_FILE_LETTER
    done
  fi
  LIST_FILES_LETTER+=$LAST_FILE_LETTER
  RESULT_FILE_NAME+=$LIST_FILES_LETTER
  RESULT_FILE_NAME+="_"
  RESULT_FILE_NAME+=`date +"%d%m%y"`
  RESULT_FILE_NAME+="." 
  RESULT_FILE_NAME+=$FILE_TYPE
}

function s21_create_folders {
  s21_create_folder_name
  mkdir $RESULT_FOLDER_NAME
  echo "$PATH_TO_FILE"/"$RESULT_FOLDER_NAME | $(date +'%H:%M %d/%m/%y') |"  >> log.txt
}

function s21_create_files {
  LIST_FILES_LETTER=""

  for (( j=1; j<=$COUNT_OF_FILES; j++ ))
  do 
    s21_create_file_name
    fallocate -l $SIZE_OF_FILES"KB" $PATH_TO_FILE/$RESULT_FOLDER_NAME/$RESULT_FILE_NAME 2>/dev/null
    echo "$PATH_TO_FILE"/"$RESULT_FOLDER_NAME"/"$RESULT_FILE_NAME | $(date +'%H:%M %d/%m/%y') | $SIZE_OF_FILES"kb"" >> log.txt
    FREE_SIZE=`df -BM / | grep '/' | awk '{ print $4 }' | awk -F "M" '{ print $1 }' `

    if [[ FREE_SIZE -le 1024 ]]
    then
        echo "free size less or equal 1GB"
        exit 1
    fi
  done
}

function s21_create {
  LIST_FOLDER_LETTER=""

  for (( k=1; k<=$COUNT_OF_FOLDERS; k++ ))
  do
    s21_create_folders
    s21_create_files
  done
}
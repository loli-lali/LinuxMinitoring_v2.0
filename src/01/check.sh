#!/bin/bash


function s21_check {
  pattern_2='^[0-9]+?$'
  pattern_3='^[a-zA-Z]{1,7}$'
  pattern_5='^[a-zA-Z]{1,7}.[a-zA-Z]{1,3}$'
  pattern_6='^([1-9]|([1-9][0-9])|100)kb$'
  
  if ! [[ -d $1 ]]
  then
    echo "ILLEGAL PARAMETERS: arg 1. The path does not exist"
    return 2
  fi
  
  if ! [[ $2 =~ $pattern_2 && $2 -ne 0 ]]
  then 
    echo "ILLEGAL PARAMETERS: arg 2. Enter the number of folders. This is a non-zero integer."
    return 2
  fi
  
  if ! [[ $3 =~ $pattern_3 ]]
  then
    echo "ILLEGAL PARAMETERS: arg 3. Enter a list of English alphabet letters (no more than 7 characters). "
    return 2
  fi
  
  if ! [[ $4 =~ $pattern_2  && $4 -ne 0 ]]
  then
    echo "ILLEGAL PARAMETERS: arg 4. Enter the number of files in each created folder"
    return 2
  fi 

  if ! [[ $5 =~ $pattern_5 ]]
  then 
    echo "ILLEGAL PARAMETERS: arg 5. Enter no more than 7 characters for the name, no more than 3 characters for the extension"
    return 2
  fi

  if ! [[ $6 =~ $pattern_6 ]]
  then 
    echo "ILLEGAL PARAMETERS: arg 6. Enter file size (in kb, but not more than 100)"
    return 2
  fi
}

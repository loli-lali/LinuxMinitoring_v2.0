#!/bin/bash

  source check.sh
  source process.sh

  s21_check $#
  if [[ $? -ne 2 ]] 
  then
      case $1 in
        1) s21_clean_one
        ;;
        2) s21_clean_two
        ;;
        3) s21_clean_three
        ;;
        *) echo "ILLEGAL PARAMETERS: enter one number: 1 or 2 or 3"
        ;;
      esac
  fi

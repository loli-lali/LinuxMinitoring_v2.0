#!/bin/bash

function s21_check {
  if [[ $1 -ne 0 ]]
  then
      echo "ILLEGAL PARAMETERS: the script is executed without arguments"
      return 2
  fi
}
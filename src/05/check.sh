#!/bin/bash

function s21_check {
    case $1 in
      1) s21_sort_code
      ;;
      2) s21_sort_ip
      ;;
      3) s21_sort_error
      ;;
      4) s21_sort_error_ip
      ;;
      *) echo "ILLEGAL PARAMETERS: enter one number: 1 - 4"
        return 2
      ;;
    esac
    
}
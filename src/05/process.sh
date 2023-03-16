#!/bin/bash

function s21_sort_code {
  for (( i=1; i<=5; i++ ))
  do
   sort -k8 ../04/access_log_$i.log | awk '{ print>"sort_log_"'$i'".log" }' 
  done
}

function s21_sort_ip {
  for (( i=1; i<=5; i++ ))
  do
     awk '{ print $1 }' ../04/access_log_$i.log | uniq >> uniq_sort_log_2.log
  done
}

function s21_sort_error {
  for (( i=1; i<=5; i++ ))
  do
    awk '$9 ~/[45][0][0-4]/ {print}' ../04/access_log_$i.log >> uniq_sort_log_3.log
  done
}

function s21_sort_error_ip {
  for (( i=1; i<=5; i++ ))
  do
     awk '$9 ~/[45][0][0-4]/ {print $1}' ../04/access_log_$i.log | uniq >> uniq_sort_error.log
  done
}
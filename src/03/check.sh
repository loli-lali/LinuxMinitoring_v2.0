#!/bin/bash

function s21_check {
  if [[ $1 -ne  1 ]]
  then 
    echo "ILLEGAL PARAMETERS: enter 3 arguments"
    return 2
  fi
}

function s21_check_date {
    FIRST_STRING_LOG=`head -1 log.txt`
    LAST_STRING_LOG='tail -4 log.txt | head -1'

    LOG_BEGIN_HOUR=`head -1 log.txt | awk -F ":" '{print $1}' | awk -F " " '{print $3}'`
    LOG_BEGIN_MIN=`head -1 log.txt | awk -F ":" '{print $2}' | awk -F ":" '{print $1}'`
    
    LOG_END_HOUR=`tail -4 log.txt | head -1 | awk -F ":" '{print $1}' | awk -F " " '{print $3}'`
    LOG_END_MIN=`tail -4 log.txt | head -1 | awk -F ":" '{print $2}' | awk -F ":" '{print $1}'`
    YEAR_LOG=`head -1 log.txt | awk -F " " '{print $4}' | awk -F "-" '{print $1}'` 
    DAY_LOG=`head -1 log.txt | awk -F " " '{print $4}' | awk -F "-" '{print $2}'` 
    MONTH_LOG=`head -1 log.txt | awk -F " " '{print $4}' | awk -F "-" '{print $3}'` 

    HOUR_1=`echo $arg1 | awk -F ":" '{print $1}'`
    MIN_1=`echo $arg1 | awk -F ":" '{print $2}'`

    HOUR_2=`echo $arg2 | awk -F ":" '{print $1}'`
    MIN_2=`echo $arg2 | awk -F ":" '{print $2}'`

    YEAR=`echo $arg3 | awk -F "-" '{print $1}'`
    DAY=`echo $arg3 | awk -F "-" '{print $2}'`
    MONTH=`echo $arg3 | awk -F "-" '{print $3}'`
    
    pattern_hour='^([1-9]|([1][0-9])|[2][0-4])$'
    pattern_min='^([0-9]|([1-5][0-9]|60))$'
    
    if ! [[ $HOUR_1 =~ $pattern_hour || $HOUR_2 =~ $pattern_hour ]]
    then
        echo "ILLEGAL PARAMETERS: pattern not valid"
        return 2
    fi

    if ! [[ $MIN_1 =~ $pattern_min || $MIN_2 =~ $pattern_min ]]
    then 
        echo "ILLEGAL PARAMETERS: minutes not valid"
        return 2
    fi

    if [[ ($HOUR_1 -gt $HOUR_2) ]] 
    then
        echo "ILLEGAL PARAMETERS: hour not valid"
        return 2
    fi
}
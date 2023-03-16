#!/bin/bash

function s21_generate_log {
  COUNT_OF_RECORDS=`echo $(( $RANDOM % 1000 + 100 ))`

  for (( j=1; j<=$COUNT_OF_RECORDS; j++ ))
  do 
    ADD=`echo $(( $RANDOM % 20 + 5 ))`
    IP=`echo "$(( $RANDOM % 225 + 30 )).$(( $RANDOM % 255 )).$(( $RANDOM % 255 )).$(( $RANDOM % 155 ))"`
    ADD_SEC=$(( $ADD_SEC + $ADD ))
    TIME_LOCAL=`date -d "$DATE + $ADD_SEC seconds" +"%d/%b/%Y:%H:%M:%S %z"`
    RANDOM_METOD=`echo ${methods_array[$(($RANDOM%5))]}`
    RANDOM_REQEST=`echo ${request_array[$(($RANDOM%15))]}`
    RANDOM_PROTOCOL=`echo ${protocols_array[$(($RANDOM%3))]}`
    RANDOM_CODE=`echo ${code_array[$(($RANDOM%10))]}`
    RANDOM_AGENT=`echo ${agents_array[$(($RANDOM%9))]}`
    RANDOM_ADDR=`echo ${addr_array[$(($RANDOM%4))]}`
    RANDOM_ADDR_2=`echo ${addr_array_2[$(($RANDOM%2))]}`
    COUNT_OF_BYTES=`echo $(( $RANDOM ))`

      s21_write_log
  done
}

function s21_write_log {
  echo -n "$IP " >> access_log_$i.log
  echo -n "- - " >> access_log_$i.log
  echo -n "[$TIME_LOCAL] " >> access_log_$i.log
  echo -n "\"$RANDOM_METOD  /$RANDOM_REQEST.html $RANDOM_PROTOCOL\" " >> access_log_$i.log
  echo -n "$RANDOM_CODE " >> access_log_$i.log
  echo -n "$COUNT_OF_BYTES " >> access_log_$i.log
  echo -n "\"https://$RANDOM_ADDR/$RANDOM_ADDR_2\" " >> access_log_$i.log
  echo -n "\"$RANDOM_AGENT\" " >> access_log_$i.log
  echo -e >> access_log_$i.log
}

function s21_process {
  code_array=(200 201 400 401 403 404 500 501 502 503)
  methods_array=(GET POST PUT PATCH DELETE)
  agents_array=(Mozilla Google Chrome Opera Safari "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
  request_array=(job book take lake late bin dir vim cat sed mine run build git bot)
  protocols_array=(HTTP/0.9 HTTP/1.1 HTTP/2.0)
  addr_array=(home work example state)
  addr_array_2=(sign-in sign-up)
  DATE="$(date +%Y)-$(date +%m)-$(date +%d) 08:00:00 $(date +%z)"

  for (( i=1; i<=5; i++ ))
  do  
      ADD_SEC=0
      s21_generate_log $i
      DATE="$(date +%Y)-$(date +%m)-$(date +%d) 08:00:00 $(date +%z)"
      DATE="$(date -d "$DATE - $i days" +'%Y-%m-%d')"
  done
}

#!/bin/bas

source check.sh

s21_check $#

if [[ $? -ne 2 ]]
then
    stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s
fi
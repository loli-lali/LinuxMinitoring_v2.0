#!/bin/bash

source check.sh

s21_check $#

if [[ $? -ne 2 ]]
then
    goaccess -f ../04/*.log --log-format=COMBINED --output=file.html
    open file.html
fi
#!/bin/bash

source check.sh
source process.sh


if [[  $# -ne 1 ]]
then
    echo "ILLEGAL PARAMETERS: enter 1 arguments"
else
    s21_check $1
fi
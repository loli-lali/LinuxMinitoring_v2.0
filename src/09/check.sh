#!/bin/bash

if [[ $? -ne 0 ]]
then
    echo "ILLEGAL PARAMETERS: the script is executed without arguments"
    return 2
fi
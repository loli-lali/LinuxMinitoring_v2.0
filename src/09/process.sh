#!/bin/bash

function s21_make_html {
    for (( i=1; i <=20; i++))
    do
    if [[ -f $TARGET_PATH$NAME_FILE ]]
    then
        rm -rf $TARGET_PATH$NAME_FILE
    fi
    s21_get_value_of_metrics
    s21_print
    sleep 3
    done
}

function s21_get_value_of_metrics {
    CPU_COUNT_OF_PREPROCESSORS=`cat /proc/cpuinfo | grep processor | wc -l`
    LOAD_AVERAGE_1_MIN=`cat /proc/loadavg | awk -F " " '{print $1}'`
    LOAD_AVERAGE_5_MIN=`cat /proc/loadavg | awk -F " " '{print $2}'`
    LOAD_AVERAGE_15_MIN=`cat /proc/loadavg | awk -F " " '{print $3}'`
    COUNT_OF_PROCESS=`cat /proc/loadavg | awk -F " " '{print $4}' | awk -F "/" '{print $1}'`

    MEM_TOTAl=`free | grep Mem | awk -F " " '{print $2}'`
    MEM_USED=`free | grep Mem | awk -F " " '{print $3}'`
    MEM_FREE=`free | grep Mem | awk -F " " '{print $4}'`

    DISK_SPACE_USED=`df / | grep "/" | awk -F " " '{print $3}'`
    DISK_SPACE_FREE=`df / | grep "/" | awk -F " " '{print $4}'`
    DISK_SPACE_PROCENT=`df / | grep "/" | awk -F " " '{print $5}' | awk -F "%" '{print $1}'`
}

function s21_print {
    echo -e "#HELP cpu_count_of_preprocessors /proc/cpuinfo"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE cpu_count_of_preprocessors summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "cpu_count_of_preprocessors $CPU_COUNT_OF_PREPROCESSORS" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP load_average summary /proc/loadavg"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE load_average summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "load_average_1s $LOAD_AVERAGE_1_MIN" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP load_average summary /proc/loadavg"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE load_average summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "load_average_5s $LOAD_AVERAGE_5_MIN" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP load_average summary /proc/loadavg"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE load_average summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "load_average_15s $LOAD_AVERAGE_15_MIN" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP count_of_process summary /proc/loadavg"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE count_of_process summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "count_of_process $COUNT_OF_PROCESS" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP mem_total summary free"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE mem_total summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "mem_total $MEM_TOTAl" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP mem_used summary free"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE mem_used summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "mem_used $MEM_USED" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP mem_free summary free"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE mem_free summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "mem_free $MEM_FREE" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP disk_space_used summary df"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE disk_space_used summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "disk_space_used $DISK_SPACE_USED" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP disk_space_free summary df"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE disk_space_free summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "disk_space_free $DISK_SPACE_FREE" >> $TARGET_PATH$NAME_FILE
    echo -e "#HELP disk_space_percent df"  >> $TARGET_PATH$NAME_FILE
    echo -e "#TYPE disk_space_percent summary"  >> $TARGET_PATH$NAME_FILE
    echo -e "disk_space_percent $DISK_SPACE_PROCENT" >> $TARGET_PATH$NAME_FILE
}
#!/bin/bash

if   [[ $# -eq 0 ]]; then
    robot -d ./tests/logs/ tests/features
elif [[ $# == 1 ]]; then
    robot -d ./tests/logs/ tests/features/${1}.robot
elif [[ $# == 2 ]]; then
    robot -d ./tests/logs/ -i ${2} tests/features/${1}.robot
else
    echo '\nno parameters -> run all robo using logs folder'
    echo '\n1  parameter  -> run specific "${PARAM1}".robot'
    echo '\n2  parameters -> run specific "${PARAM1}".robot and specific Tag "${PARAM2}"'
fi
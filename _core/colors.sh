#!/usr/bin/env bash

BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
ORANGE="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
NC="\033[0;0m"

print_var()
{
    PRINT_STR=$1
    PRINT_COLOR=${2}
    PRINT_STYLE=${3:0}

    black="30m"
    red="31m"
    green="32m"
    orange="33m"
    blue="34m"
    purple="35m"
    cyan="36m"
    white="37m"


    RESULT="\033[$PRINT_STYLE;${!PRINT_COLOR}"

    echo -e ${RESULT}$PRINT_STR${NC}
}

log()
{
    print_var $1 "white" 0
}

info()
{
    print_var $1 "blue" 0
}

warning()
{
    print_var $1 "orange" 0
}

success()
{
    print_var $1 "green" 0
}

error()
{
    print_var $1 "error" 0
}

title()
{
    print_var $1 "purple" 1
}
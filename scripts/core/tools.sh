#!/usr/bin/env bash

#
#
#
get_spaces()
{
    FULLNAME=$1
    LONGEST_NAME=$2
    NUM_SPACES=$((${#LONGEST_NAME} - ${#FULLNAME} + 2))

    SPACES=$(printf '%*s' "$NUM_SPACES" | tr ' ' " ")

    echo "$SPACES"
}

get_description()
{
    DESC=$(sed '2q;d' $1)
    if [[ ${DESC:0:1} != '#' ]]
    then
        NEW_STR="No description"
    else
        NEW_STR=${DESC#"#"}
    fi
    echo "$NEW_STR"
}

get_longest_name()
{
    LONGEST_NAME=""

    for DIR in $ROOT_PATH/src/*
    do
        if [[ -d $DIR ]]; then
            for FILE in $DIR/*
            do
                if [[ -f $FILE ]]; then
                    DIRNAME=${DIR##*/}
                    FILENAME=${FILE##*/}
                    SCRIPTNAME=${FILENAME%.*}
                    FULLNAME="$DIRNAME:$SCRIPTNAME"
                    if [ ${#FULLNAME} -ge ${#LONGEST_NAME} ];
                    then
                        LONGEST_NAME=$FULLNAME
                    fi
                fi
            done
        fi
    done
}
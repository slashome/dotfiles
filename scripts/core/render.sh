#!/usr/bin/env bash

##
# Render a single description
#
# @var DIR
##
render_script()
{
    DIR=$1
    FILEPATH=$2
    LONGEST_NAME=$3

    DIRNAME=${DIR##*/}
    FILENAME=${FILEPATH##*/}
    SCRIPTNAME=${FILENAME%.*}
    FULLNAME="$DIRNAME:$SCRIPTNAME"

    SPACES=$(get_spaces $FULLNAME $LONGEST_NAME)
    DESC=$(get_description $FILEPATH)

    echo -e "${GREEN} $FULLNAME${NC}$SPACES${WHITE}$DESC${NC}"
}

render_usage()
{
    VERSION="0.0.1"

    echo -e "Script Launcher ${GREEN}$VERSION${NC}"
    echo ""
    echo -e "${ORANGE}Usage:${NC}"
    echo -e "  command [options] [arguments]"

    # @TODO : Manage options
#    echo -e ""
#    echo -e "${ORANGE}Options:${NC}"
#    echo -e "${GREEN}  -h, --help            ${NC}Display this help message"
#    echo -e "${GREEN}  -q, --quiet           ${NC}Do not output any message"
#    echo -e "${GREEN}  -V, --version         ${NC}Display this application version"
#    echo -e "${GREEN}      --ansi            ${NC}Force ANSI output"
#    echo -e "${GREEN}      --no-ansi         ${NC}Disable ANSI output"
#    echo -e "${GREEN}  -n, --no-interaction  ${NC}Do not ask any interactive question"
#    echo -e "${GREEN}  -e, --env=ENV         ${NC}The environment name ${ORANGE}[default: "dev"]"
#    echo -e "${GREEN}      --no-debug        ${NC}Switches off debug mode"
#    echo -e "${GREEN}  -v|vv|vvv, --verbose  ${NC}Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug"
}

render_list()
{
    echo -e "${ORANGE}Available commands:${NC}"
    echo -e "${GREEN} list               ${WHITE}Lists commands"
    echo -e "${GREEN} about              ${WHITE}Displays information about the current project"

    LONGEST_NAME=$(get_longest_name)

    for DIR in $ROOT_PATH/src/*
    do
        if [[ -d $DIR ]]; then
            echo  -e "${ORANGE}${DIR##*/}${NC}"
                for FILE in $DIR/*
                do
                    if [[ -f $FILE ]]; then
                        render_script $DIR $FILE $LONGEST_NAME
                    fi
                done
        fi
    done
}

render_about()
{
    echo -e " -------------------- ---------------------------------"
    echo -e "${GREEN}  Script Launcher${NC}"
    echo -e " -------------------- ---------------------------------"
    echo -e "  Version              0.0.1"
    echo -e " -------------------- ---------------------------------"
    echo -e "  Author               slashome"
    echo -e "  Github               github.com/slashome"
    echo -e " -------------------- ---------------------------------"
    echo -e ""
}

render_help()
{
    # Render menu
    render_usage
    echo ""
    # Render list of scripts
    render_list
}
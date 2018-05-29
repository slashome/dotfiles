#!/usr/bin/env bash

runner()
{
    COUNT=0
    IFS=':' read -ra ARGS <<< "$@"

    ASK_DIR=""
    RUN_CMD=""

    for ARG in "${ARGS[@]}"; do
        COUNT=$((COUNT+1))
        if [ "$COUNT" -eq "1" ]; then
            ASK_DIR="$ARG"
        fi
        if [ "$COUNT" -eq "2" ]; then
            RUN_CMD="$ARG"
        fi
    done

    RUN_DIR=$ROOT_PATH/src/$ASK_DIR

    # @TODO : test if dir is .. or .
    if [ ! -d "$RUN_DIR" ]; then
        echo ""
        echo -e "${RED}   /!\\ ${ORANGE}$ASK_DIR ${RED}is not an option /!\\ ${NC}"
        echo ""

        render_help
        exit
    fi

    RUN_PATH=$RUN_DIR/$RUN_CMD

    if [ ! -f "$RUN_PATH" ]; then
        echo ""
        echo -e "${RED}   /!\\ ${ORANGE}$RUN_CMD ${RED}is not a command /!\\ ${NC}"
        echo ""

        render_help
        exit
    fi

    source $RUN_PATH
}

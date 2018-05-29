#!/bin/bash

# Get root path of script
ROOT_PATH="$(dirname "$(readlink -f "$0")")"

# Source init file
source $ROOT_PATH/core/init.sh

# Run
init
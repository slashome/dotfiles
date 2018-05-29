#!/usr/bin/env bash

# Load configuration files
source $ROOT_PATH/config/global.cfg

if [ -f $ROOT_PATH/config/secrets.cfg ]; then
  source $ROOT_PATH/config/secrets.cfg
fi

# Load files
source $ROOT_PATH/core/loader.sh

# Force rights of the all project
chmod 755 -R $ROOT_PATH

# Get args
if [ $# -eq 0 ]
then
	render_help
else
    runner "$@"
fi

exit

#!/bin/bash

# define colors
RED=%{F#eb3324}
ORANGE=%{F#FFA500}
GREEN=%{F#07b200}
NC=%{F#eb3324}

STORAGE_PATH=/home/flow/workspace/projects/supermood/supermood/platform/backend/services/supermood-api/logs
ANGULAR_FILE=$STORAGE_PATH/angular.log
GRUNT_FILE=$STORAGE_PATH/grunt.watch.log

# check pulse status
case "$1" in
"ang")
  LAST_LINE=`awk '/./{line=$0} END{print line}' $ANGULAR_FILE`
  if [[ $LAST_LINE == ': Compiled successfully.' ]]
  then
  	echo "$GREEN    $NC"
  else
  	echo "$RED    $NC"
  fi
;;
"grunt")
  COUNT=$(wc -l < "$GRUNT_FILE")
  LAST_LINE=`awk '{this=last;last=$0} END{print this}' $GRUNT_FILE | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"`
  if [[ $LAST_LINE == 'Done.' ]] || [[ $COUNT == "2" ]]
  then
  	echo "$GREEN    $NC"
  else
  	echo "$RED    $NC"
  fi
esac


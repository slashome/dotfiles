#!/bin/bash

# define colors
RED=%{F#eb3324}
GREEN=%{F#07b200}
NC=%{F#eb3324}

ANGULAR_FILE=/home/flow/workspace/projects/main-app/logs/angular.log
GRUNT_FILE=/home/flow/workspace/projects/main-app/logs/grunt.watch.log

# check pulse status
case "$1" in
"ang")
  LAST_LINE=`awk '/./{line=$0} END{print line}' $ANGULAR_FILE`
  if [[ "${LAST_LINE:29}" == 'Compiled successfully.' ]]
  then
  	echo "$GREEN  A  $NC"
  else
  	echo "$RED  A  $NC"
  fi
;;
"grunt")
  COUNT=$(wc -l < "$GRUNT_FILE")
  LAST_LINE=`awk '{this=last;last=$0} END{print this}' $GRUNT_FILE | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"`
  if [[ $LAST_LINE == 'Done.' ]] || [[ $COUNT == "2" ]]
  then
  	echo "$GREEN  G  $NC"
  else
  	echo "$RED  G  $NC"
  fi
esac


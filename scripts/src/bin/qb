#!/bin/bash
#Qutebrowser profile launcher (create it if not exist)

################################################################################
# Author:   slashome (slashome AT gmail.com)
# Web:      http://slashome.io
#
# Program:
#   Launch qutebrowser with specific profile
#   Please don't hesitate to improve code and make a pull request
#
################################################################################

# If recommand to create a symbolic link of this script in /usr/bin
# sudo ln -s <path_of_the_script>/qb-profiles.sh /usr/bin/qb

# TODO : argument to delete profile with confirm

PROFILE="default"

if [ -n "$1" ]
then
  PROFILE=$1
fi

PROFILE_PATH=~/.config/qutebrowser/$PROFILE

#if [ -d $PROFILE_PATH && -d ~/.config/qutebrowser/default && $PROFILE -eq
#  default ]
#then
#  echo "yes !"
#  # If directory does not exist and is not default then link config
#fi

qutebrowser --enable-webengine-inspector --basedir $PROFILE_PATH

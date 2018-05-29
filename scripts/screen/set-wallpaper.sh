#/bin/bash
#Set a random wallpaper

# CONFIGURATION
WALLPAPERS_DIR="$HOME/pictures/wallpapers"

# VARIABLES
LOCAL_PATH=$(find $WALLPAPERS_DIR -type f | sort --random-sort | head -n 1  | sed 's/ /\\ /g')
FILENAME=$(basename $LOCAL_PATH)
FILE_EXT="${FILENAME##*.}"

# @TODO : Handle remote machines
#REMOTE_IP=192.168.2.35
#REMOTE_ADDR=flow@$REMOTE_IP
#REMOTE_PATH=/Users/flow/pictures/wallpapers/$FILENAME

# delete previous wallpaper
rm $HOME/.cache/.wallpie.*
# copy
cp $LOCAL_PATH $HOME/.cache/.wallpie.$FILE_EXT

feh --bg-fill $LOCAL_PATH

if (exec 3<>/dev/tcp/$REMOTE_IP/22) 2> /dev/null; then
	scp $LOCAL_PATH $REMOTE_ADDR:$REMOTE_PATH
	ssh $REMOTE_ADDR "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$REMOTE_PATH\"'"
fi

./lock.sh -u $HOME/.cache/.wallpie.$FILE_EXT

#sleep 10
#$HOME/workspace/scripts/sleep-monitors.sh

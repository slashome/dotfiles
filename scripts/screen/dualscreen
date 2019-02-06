
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 \
       --output DP1 --off \
       --output HDMI1 --mode 1920x1200 --pos 0x0 --rotate normal \
       --output VIRTUAL1 --off
exit

function getXrandrArgs()
{
    xrandr | while read LINE
    do
        if [ "$SCREEN_NAME" != "" ]; then
            RESOLUTION=$(echo $LINE | awk '{print $1}')
            echo "$XRANDR_PARAMS --output $SCREEN_NAME --mode $RESOLUTION --pos 0x0 --rotate normal"
            SCREEN_NAME=""
        fi

        WORD2=$(echo $LINE | awk '{print $2}')
        if [ "$WORD2" == "connected" ]; then
            SCREEN_NAME=$(echo $LINE | awk '{print $1}')
        fi
    done
}

function getScreenCount()
{
    CNT=$(getScreenCountString)
    echo "${CNT##* }"
}

function getScreenCountString()
{
    xrandr | while read LINE
    do
        WORD2=$(echo $LINE | awk '{print $2}')
        if [ "$WORD2" == "connected" ]; then
          COUNT=$((COUNT+1))
          echo - $COUNT
        fi
    done
}

echo $(getScreenCount)

exit

MONITOR_LEFT=HDMI1
MONITOR_RIGHT=eDP1


--output $MONITOR_LEFT --primary --mode 1920x1080 --pos 0x360 --rotate normal \
       --output $MONITOR_RIGHT --mode 1920x1080 --pos 1920x0 --rotate normal
exit


MODE="dualscreen"

# default monitor is LVDS1
MONITOR_1=LVDS1
MONITOR_2=LVDS1

DELAY=5

# functions to switch from LVDS1 to VGA and vice versa
function SingleScreenMode {
    echo "Switching to single screen mode"
    xrandr --output VGA1 --mode 1920x1080 --dpi 160 --output LVDS1 --off
    MONITOR=VGA1
}
function DualScreenMode {
    echo "Switching to dual screen mode"
    xrandr --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x360 --rotate normal --output HDMI-2 --mode 2560x1440 --pos 1920x0 --rotate normal
    MONITOR=LVDS1
}

# functions to check if VGA is connected and in use
function VGAActive {
    [ $MONITOR = "VGA1" ]
}
function VGAConnected {
    ! xrandr | grep "^VGA1" | grep disconnected
}

# @TODO : Restart i3


# actual script
while true
do
    if ! VGAActive && VGAConnected
    then
        ActivateVGA
    fi

    if VGAActive && ! VGAConnected
    then
        DeactivateVGA
    fi

    sleep $DELAY
done

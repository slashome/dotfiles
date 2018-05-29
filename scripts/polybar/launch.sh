#!/bin/bash
#Kill and launch polybar

killall polybar;

#MONITOR=HDMI1 polybar -r dual_left &
#MONITOR=eDP1 polybar -r dual_right &

MONITOR=eDP1 polybar -r mono &

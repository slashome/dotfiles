#!/bin/sh

RED=%{F#eb3324}
GREEN=%{F#07b200}
NC=%{F#eb3324}



if ! updates_arch=$(pacman -Qu | wc -l); then
  updates_arch=0
fi

if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo "$GREEN   $updates $NC"
else
    echo "   0 "
fi

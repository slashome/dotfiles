#!/bin/bash

if [ ! -f $HOME/.cache/wal/sequences ]; then
	mkdir -p $HOME/.cache/wal
	touch $HOME/.cache/wal/sequences
	touch $HOME/.cache/wal/colors-tty.sh
fi

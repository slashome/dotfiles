#!/bin/bash

DEST_DIR=$HOME/.config/i3

createFolder $DEST_DIR

createLink i3-gaps/scripts $DEST_DIR/scripts
createLink i3-gaps/config._melchizedek $DEST_DIR/config

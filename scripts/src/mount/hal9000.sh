#!/bin/bash

MOUNT_FOLDER=$HOME/workspace/mount/hal9000

if [ -d $MOUNT_FOLDER ]; then
  mkdir -p $MOUNT_FOLDER
fi

echo $HAL_PASS | sshfs flow@hal9000.im:/ $MOUNT_FOLDER -o port=$HAL_PORT -o compression=yes -o Ciphers=arcfour -o sshfs_debug -o debug  -o IdentityFile=$HOME/.ssh/id_rsa -o password_stdin

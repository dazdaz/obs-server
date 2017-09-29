#!/bin/bash
### every exit != 0 fails the script
set -e

# Start SSH
service ssh start

# Start Supervisord
$STARTUPDIR/vnc_startup.sh > /var/log/vnc.log 2>&1 &

# Gime gime gime a shell after midnight
zsh


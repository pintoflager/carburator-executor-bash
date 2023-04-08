#!/usr/bin/env sh

role="$1"

# App installation tasks on a client node. Runs first
if [ "$role" = 'client' ]; then
    carburator print terminal info "Executing install script on a client"
fi

# App installation tasks on remote server node.
if [ "$role" = 'server' ]; then
    carburator print terminal info "Executing install script on a server"
fi

# Bash needs bash
if ! carburator has program bash; then
    carburator print terminal error \
        "Missing required program bash. Trying to install..."
else
    exit
fi

# TODO: Untested below
if carburator has program apt; then
    carburator sudo apt update
    carburator sudo apt -y install bash

elif carburator has program pacman; then
    carburator sudo pacman -Suy bash

elif carburator has program yum; then
    carburator sudo yum makecache --refresh
    carburator sudo yum install bash

elif carburator has program dnf; then
    carburator sudo dnf makecache --refresh
    carburator sudo dnf -y install bash

else
    carburator print terminal error \
        "Unable to detect package manager from client node linux"
    exit 120
fi

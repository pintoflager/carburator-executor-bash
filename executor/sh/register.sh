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
    carburator print terminal success "Bash found from the client"
    exit 0
fi

# TODO: Untested below
if carburator has program apt; then
    apt-get -y update
    apt-get -y install bash

elif carburator has program pacman; then
    pacman update
    pacman -Sy bash

elif carburator has program yum; then
    yum makecache --refresh
    yum install bash

elif carburator has program dnf; then
    dnf makecache --refresh
    dnf install bash -y

else
    carburator print terminal error \
        "Unable to detect package manager from client node linux"
    exit 120
fi

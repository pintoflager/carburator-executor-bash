#!/usr/bin/env sh

role="$1"

# If bash is present don't bother with the install
if ! carburator has program bash; then
    carburator log warn \
        "Missing required program bash. Trying to install with package manager..."
else
    carburator log success "bash found from the $role node."
    exit 0
fi

# App installation tasks on a client node. Runs first, runs as normal user.
if [ "$role" = 'client' ]; then
    carburator log info \
        "Executing register script on a client node"

    carburator prompt yes-no \
        "Should we try to install bash on your computer?" \
            --yes-val "Yes try to install with a script" \
            --no-val "No, I'll install everything myself"; exitcode=$?

    if [ $exitcode -ne 0 ]; then
        exit 120
    fi

    # TODO: Untested below
    if carburator has program apt; then
        sudo apt-get -y update
        sudo apt-get -y install bash

    elif carburator has program pacman; then
        sudo pacman update
        sudo pacman -Sy bash

    elif carburator has program yum; then
        sudo yum makecache --refresh
        sudo yum install epel-release
        sudo yum install bash

    elif carburator has program dnf; then
        sudo dnf makecache --refresh
        sudo dnf -y install bash

    else
        carburator log error \
            "Unable to detect package manager from localhost OS"
        exit 120
    fi    
fi

# App installation tasks on remote server node. Runs as root.
if [ "$role" = 'server' ]; then
    carburator log info \
        "Executing register script on a server node"

    # TODO: Untested below
    if carburator has program apt; then
        apt-get -y update
        apt-get -y install bash

    elif carburator has program pacman; then
        pacman update
        pacman -Sy bash

    elif carburator has program yum; then
        yum makecache --refresh
        yum install epel-release
        yum install bash

    elif carburator has program dnf; then
        dnf makecache --refresh
        dnf -y install bash

    else
        carburator log error \
            "Unable to detect package manager from server node linux"
        exit 120
    fi
fi

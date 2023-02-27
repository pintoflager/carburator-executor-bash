#!/usr/bin/env sh

role="$1"

# App installation tasks on a client node. Runs first
if [ "$role" = 'client' ]; then
    # TODO: get rid of these notifications. Left for debugging only.
    carburator print terminal info "Executing install script on $role"
fi

# App installation tasks on remote server node.
if [ "$role" = 'server' ]; then
    # TODO: get rid of these notifications. Left for debugging only.
    carburator print terminal info "Executing install script on $role"
fi

# Bash needs bash
if ! carburator has program bash; then
    carburator print terminal error \
        "Missing required program bash. Please install it before proceeding."
    exit 120
fi

# TODO: Just a reminder, to figure out where (any) script runs:
# if [[ $(carburator node role) == 'client' ]]; then ...... ; fi
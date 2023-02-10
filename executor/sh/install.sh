#!/usr/bin/env sh

platform="$1"

# App installation tasks on commander node. Runs first
if [ "$platform" = 'commander' ]; then
    carburator print terminal info "Executing install script on $platform"
fi

# App installation tasks on remote worker node.
if [ "$platform" = 'worker' ]; then
    carburator print terminal info "Executing install script on $platform"
fi

# Bash needs bash
if ! carburator fn integration-installed bash; then
  carburator print terminal error \
    "Missing required program bash. Please install it before proceeding."
  exit 120
fi

# Just a reminder, to figure out where (any) script runs:
# if [[ $(carburator node platform) == 'commander' ]]; then ...... ; fi
#!/usr/bin/env sh

# Bash needs bash
if ! carburator fn integration-installed bash; then
  carburator print terminal error \
    "Missing required program bash. Please install it before proceeding."
  exit 120
fi

# TODO: just a reminder, to figure out where this script runs:
# if [[ $(carburator node platform) == 'commander' ]]; then ...... ; fi
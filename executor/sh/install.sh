#!/usr/bin/env sh

# Bash needs bash
if ! carburator fn integration-installed bash; then
  carburator print terminal error \
    "Missing required program bash. Please install it before proceeding."
  exit 120
fi

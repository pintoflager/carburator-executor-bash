#!/usr/bin/env sh

# Bash needs bash
err="Missing required program bash. Please install it before proceeding."

# If remotes don't have carburator installed we can't use it's methods.
if ! which caburator > /dev/null 2>&1; then
  if ! which bash > /dev/null 2>&1; then
    echo "$err" && exit 120
  fi
  
  exit 100
fi

if ! carburator fn integration-installed bash; then
  carburator print terminal error "$err" && exit 120
fi

#!/bin/bash

trap 'rm -f "$TMPFILE"' EXIT

#TMPFILE=$(mktemp) || exit 1
#echo "Our temp file is $TMPFILE"

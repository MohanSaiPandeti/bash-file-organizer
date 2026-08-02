#!/bin/bash

directory="$1"

if [ -z "$directory" ]; then
echo "Usage: ./organize.sh <directory>"
exit 1
fi

if [ ! -d "$directory" ]; then
echo "Error: '$directory' is not a valid directory."
exit 1
fi

echo "Organizing files in: $directory"
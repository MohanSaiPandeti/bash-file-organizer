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

for file in "$directory"/*; do
if [ -f "$file" ]; then
filename=$(basename "$file")
extension="${filename##*.}"

echo "File: $filename"
echo "Extension: $extension"
fi
done
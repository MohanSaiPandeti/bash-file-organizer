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

        # Skip project files
        if [ "$filename" = "organize.sh" ] || [ "$filename" = "README.md" ]; then
            continue
        fi

        extension="${filename##*.}"
        extension="${extension,,}"

        # Handle files without extensions
        if [ "$filename" = "$extension" ]; then
            category="Others"
        else
            case "$extension" in
                jpg|jpeg|png|gif|webp) category="Images" ;;
                pdf|doc|docx|txt) category="Documents" ;;
                mp4|mkv|avi|mov) category="Videos" ;;
                mp3|wav|aac|flac) category="Audio" ;;
                zip|rar|7z|tar|gz) category="Archives" ;;
                java|py|c|cpp|js|html|css|json|xml|sql) category="Code" ;;
                *) category="Others" ;;
            esac
        fi

        mkdir -p "$directory/$category"

        if mv "$file" "$directory/$category/"; then
            echo "$filename -> $category"
        else
            echo "Error: Could not move $filename"
        fi
    fi
done

echo "Organization complete."
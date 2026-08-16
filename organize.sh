#!/bin/bash

dry_run=false

show_help() {
    echo "Bash File Organizer"
    echo
    echo "Usage:"
    echo "  ./organize.sh [OPTIONS] <directory>"
    echo
    echo "Options:"
    echo "  --dry-run    Preview changes without moving files"
    echo "  --help       Show this help message"
    echo "  -h           Show this help message"
}

organize_file() {
    local file="$1"
    local filename
    local extension
    local category

    filename=$(basename "$file")

    # Skip project files
    if [ "$filename" = "organize.sh" ] || [ "$filename" = "README.md" ]; then
        return
    fi

    # Extract and normalize extension
    extension="${filename##*.}"
    extension="${extension,,}"

    # Handle files without extensions
    if [ "$filename" = "$extension" ]; then
        category="Others"
    else
        case "$extension" in
            jpg|jpeg|png|gif|webp|svg) category="Images" ;;
            pdf|doc|docx|txt|ppt|pptx|xls|xlsx|csv) category="Documents" ;;
            mp4|mkv|avi|mov|wmv|webm) category="Videos" ;;
            mp3|wav|aac|flac|ogg) category="Audio" ;;
            zip|rar|7z|tar|gz|bz2) category="Archives" ;;
            java|py|c|cpp|js|ts|html|css|json|xml|sql|r) category="Code" ;;
            *) category="Others" ;;
        esac
    fi

    # Dry-run mode
    if [ "$dry_run" = true ]; then
        echo "[DRY RUN] $filename -> $category"
        return
    fi

    # Create category directory
    mkdir -p "$directory/$category"

    # Move file
    if mv "$file" "$directory/$category/"; then
        echo "$filename -> $category"
    else
        echo "Error: Could not move '$filename'"
    fi
}

# Handle help
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_help
    exit 0
fi

# Handle command-line arguments
if [ "$1" = "--dry-run" ]; then
    dry_run=true
    directory="$2"
else
    directory="$1"
fi

# Validate directory argument
if [ -z "$directory" ]; then
    echo "Usage: ./organize.sh [OPTIONS] <directory>"
    echo "Use './organize.sh --help' for more information."
    exit 1
fi

if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    exit 1
fi

echo "Organizing files in: $directory"
echo

# Process files in the directory
for file in "$directory"/*; do
    if [ -f "$file" ]; then
        organize_file "$file"
    fi
done

echo
echo "Organization complete."
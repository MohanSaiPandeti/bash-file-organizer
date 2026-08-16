# Bash File Organizer

A lightweight Bash CLI utility that automatically organizes files into categorized directories based on their file extensions.

## Features

- Organizes files by extension
- Supports images, documents, videos, audio, archives, and code
- Case-insensitive extension detection
- Handles files without extensions
- Automatically creates category directories
- Recursive directory organization
- Dry-run mode
- Duplicate-safe file handling
- Help command
- Protected project files
- Automated test suite
- Handles filenames containing spaces

## Supported Categories

| Category | Extensions |
|---|---|
| Images | jpg, jpeg, png, gif, webp, svg |
| Documents | pdf, doc, docx, txt, ppt, pptx, xls, xlsx, csv |
| Videos | mp4, mkv, avi, mov, wmv, webm |
| Audio | mp3, wav, aac, flac, ogg |
| Archives | zip, rar, 7z, tar, gz, bz2 |
| Code | java, py, c, cpp, js, ts, html, css, json, xml, sql, r |
| Others | Unknown extensions and files without extensions |

## Requirements

- Bash
- Git Bash, Linux, or macOS

## Usage

### Basic Organization

    ./organize.sh <directory>

Example:

    ./organize.sh ~/Downloads

### Dry Run

Preview changes without moving files:

    ./organize.sh --dry-run ~/Downloads

### Recursive Organization

Organize files inside subdirectories:

    ./organize.sh --recursive ~/Downloads

### Recursive Dry Run

    ./organize.sh --recursive --dry-run ~/Downloads

### Help

    ./organize.sh --help

## Example

### Before

    Downloads/
    ├── photo.jpg
    ├── resume.pdf
    ├── movie.mp4
    ├── song.mp3
    └── archive.zip

### After

    Downloads/
    ├── Images/
    │   └── photo.jpg
    ├── Documents/
    │   └── resume.pdf
    ├── Videos/
    │   └── movie.mp4
    ├── Audio/
    │   └── song.mp3
    └── Archives/
        └── archive.zip

## Duplicate Handling

Existing files are never overwritten.

If photo.jpg already exists, the organizer creates:

    photo_1.jpg
    photo_2.jpg
    photo_3.jpg

## Testing

Run the automated test suite:

    ./tests/test_organizer.sh

The test suite covers:

- Bash syntax
- Help command
- File categorization
- Recursive organization
- Duplicate handling
- Dry-run mode
- Unknown extensions

## Project Structure

    bash-file-organizer/
    ├── organize.sh
    ├── README.md
    ├── .gitignore
    ├── .gitattributes
    └── tests/
        └── test_organizer.sh

## License

This project is available for learning and personal use.
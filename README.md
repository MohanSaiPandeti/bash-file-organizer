# Bash File Organizer

A lightweight Bash CLI utility that automatically organizes files into categorized folders based on their file extensions.

## Features

- Organizes files by extension
- Supports images, documents, videos, audio, archives, and code
- Handles uppercase extensions
- Handles files without extensions
- Automatically creates category directories
- Supports dry-run mode
- Skips project files such as `organize.sh` and `README.md`
- Reports failed file moves

## Supported Categories

| Category | Extensions |
|----------|------------|
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

Make the script executable:

```bash
chmod +x organize.sh
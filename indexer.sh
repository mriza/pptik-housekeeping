#!/bin/bash

TARGET_DIR="/path/to/your/directory"
INDEX_FILE="image_index.txt"
> "$INDEX_FILE"
sudo updatedb
locate -r "$TARGET_DIR/.*\.\(jpg\|jpeg\|png\|gif\|bmp\|tiff\)$" | while read -r file; do
    timestamp=$(stat -c %Y "$file" 2>/dev/null)
    if [ -n "$timestamp" ]; then
        echo "$file|$timestamp" >> "$INDEX_FILE"
    fi
done

echo "Index created at $INDEX_FILE"
#!/bin/bash

INDEX_FILE="image_index.txt"
AGE_THRESHOLD=30
CURRENT_TIME=$(date +%s)
CUTOFF_TIME=$((CURRENT_TIME - AGE_THRESHOLD * 86400))
while IFS='|' read -r file timestamp; do
    if [ "$timestamp" -lt "$CUTOFF_TIME" ]; then
        echo "Deleting $file (created on $(date -d @"$timestamp"))"
        rm "$file"
    fi
done < "$INDEX_FILE"

echo "Deletion completed."
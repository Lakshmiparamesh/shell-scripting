#!/bin/bash

# Script to replace "give" with "learning" from line 5 onwards in lines containing "welcome"

# Check if filename is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide filename"
    echo "Usage: ./replace_text.sh filename.txt"
    exit 1
fi

FILE=$1

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found"
    exit 1
fi

# Create temporary file
TEMP_FILE="${FILE}.tmp"

# Initialize line counter
LINE_NUM=1

# Read file line by line
while IFS= read -r line; do
    if [ $LINE_NUM -ge 5 ]; then
        # Check if line contains "welcome"
        if echo "$line" | grep -q "welcome"; then
            # Replace "give" with "learning"
            line=$(echo "$line" | sed 's/give/learning/g')
        fi
    fi
    echo "$line" >> "$TEMP_FILE"
    LINE_NUM=$((LINE_NUM + 1))
done < "$FILE"

# Replace original file with modified content
mv "$TEMP_FILE" "$FILE"

echo "Replacement completed successfully!"
echo "From line 5 onwards, replaced 'give' with 'learning' in lines containing 'welcome'"
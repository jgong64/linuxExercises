#!/bin/bash
# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n>" 1>&2
    exit 1
fi

# Assign the arguments to variables
directory="$1"
size_limit="$2"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found." 1>&2
    exit 1
fi

# Use find to locate and remove files larger than the specified size
find "$directory" -type f -size +"$size_limit"c -exec rm -f {} \;

echo "Files larger than $size_limit bytes in directory '$directory' have been removed."

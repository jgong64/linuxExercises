#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <column> [file.csv]"
    exit 1
fi

column="$1"
file="$2"

# If no file is provided, read from stdin
if [ -z "$file" ]; then
    data="$(cat)"
else
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Error: File $file not found."
        exit 1
    fi

    # Read the specified column from the CSV file
    data=$(cut -d',' -f "$column" "$file")
fi

# Calculate the mean of the data
mean=$(awk -F, '{s+=$1} END {print s/NR}' <<< "$data")

echo "Mean of column $column: $mean"

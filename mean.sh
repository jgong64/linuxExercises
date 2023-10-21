#!/bin/bash

# Usage statement
usage() {
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
}

# Check for the correct number of arguments
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  usage
fi

column=$1
input_file=$2

# If no input file is specified, read from stdin
if [ -z "$input_file" ]; then
  input_file=/dev/stdin
fi

# Use cut to select the required column, tail to skip the header, and awk to calculate the mean
mean=$(cut -d ',' -f $column "$input_file" | tail -n +2 | awk -F ',' '{sum+=$1} END{print sum/NR}')

echo "Mean of column $column in $input_file: $mean"

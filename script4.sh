#!/bin/bash

# Specify the directory where the files are located
directory="/path/to/directory"

# Specify the number of days to keep files
days_to_keep=7

# Specify the file extensions or patterns for temporary files and logs
file_extensions=("*.tmp" "*.log")

# Calculate the cutoff date
cutoff_date=$(date -d "$days_to_keep days ago" +%Y-%m-%d)

# Delete files older than the cutoff date and matching the specified extensions/patterns
for extension in "${file_extensions[@]}"; do
  find "$directory" -type f -name "$extension" ! -newermt "$cutoff_date" -delete
done

# Print a message indicating the files that have been deleted
echo "Deleted temporary files and logs older than $cutoff_date in $directory"


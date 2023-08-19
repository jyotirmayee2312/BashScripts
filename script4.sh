#!/bin/bash

# Set the directory path where you want to delete files
target_directory="/path/to/target/directory"

# Calculate the timestamp for files older than 1 minute
timestamp=$(date -d "-1 minute" +%s)

# Find and delete files older than the specified timestamp
find "$target_directory" -type f -mmin +1 -exec rm -f {} \;

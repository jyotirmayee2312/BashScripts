#!/bin/bash

# Specify the files and directories to be backed up
backup_files=(
  "/home/ubuntu"
)

# Specify the backup directory
backup_dir="/path/to/backup/directory"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Generate a timestamp for the backup
timestamp=$(date +%Y%m%d%H%M%S)

# Loop through the files and directories to be backed up
for file in "${backup_files[@]}"; do
  # Get the base name of the file or directory
  base_name=$(basename "$file")
  
  # Create the backup file name with the timestamp
  backup_file="$backup_dir/$base_name-$timestamp.tar.gz"
  
  # Create the backup
  tar -czf "$backup_file" "$file"
  
  # Print a message indicating the backup has been created
  echo "Backup created: $backup_file"
done

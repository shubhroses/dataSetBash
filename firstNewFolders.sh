#!/bin/bash

# Folders array
folders=("fall" "spring" "summer" "winter")

# Loop through each folder
for folder in "${folders[@]}"; do
  # Check if the folder exists
  if [ -d "$folder" ]; then
    # Get a list of directories in the folder
    for dir in $(find ./$folder -maxdepth 1 -type d); do
      # If directory is not the main folder itself
      if [ "$dir" != "./$folder" ]; then
        # Extract the directory name
        dir_name=$(basename "$dir")
        # Create a new directory name by removing the last 6 characters
        new_dir_name="${dir_name::${#dir_name}-6}042035"
        # Create the new directory
        mkdir "${dir%/*}/$new_dir_name"
      fi
    done
  else
    echo "Folder $folder does not exist."
  fi
done

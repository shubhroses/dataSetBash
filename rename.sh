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
        # Rename the directory
        mv "$dir" "${dir}043035"
      fi
    done
  else
    echo "Folder $folder does not exist."
  fi
done

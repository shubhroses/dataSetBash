#!/bin/bash

# Folders array
folders=("fall" "spring" "summer" "winter")

# Loop through each folder
for folder in "${folders[@]}"; do
  # Check if the folder exists
  if [ -d "$folder" ]; then
    # Find all directories ending with 042035 and delete them
    find ./$folder -type d -name "*042035" -exec rm -rf {} \;
  else
    echo "Folder $folder does not exist."
  fi
done

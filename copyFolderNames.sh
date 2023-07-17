#!/bin/bash

# Set folder names
old_folder="spring"
new_folder="newSpring"

# Check if the new folder exists, if not, create it
if [ ! -d "$new_folder" ]; then
  mkdir "$new_folder"
fi

# Check if the old folder exists
if [ -d "$old_folder" ]; then
  # Get a list of directories in the old folder
  for dir in $(find ./$old_folder -maxdepth 1 -type d); do
    # If directory is not the main folder itself
    if [ "$dir" != "./$old_folder" ]; then
      # Extract the directory name
      dir_name=$(basename "$dir")
      # Create a new directory name by replacing the last 6 characters with 043035
      new_dir_name="${dir_name::${#dir_name}-6}042035"
      # Create the new directory in the new folder
      mkdir "./$new_folder/$new_dir_name"
    fi
  done
else
  echo "Folder $old_folder does not exist."
fi



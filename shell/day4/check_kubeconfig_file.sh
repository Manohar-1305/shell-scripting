#!/bin/bash

read -p "Enter the folder path : " folder
read -p "Enter the file name : " file

full_path="$folder/$file"

if [ -d "$folder" ]; then
  echo "The folder '$folder' exists."

  if [ -f "$full_path" ]; then
    echo "The file '$file' exists inside the folder."

    permissions=$(ls -l "$full_path" | awk '{print $1}')

    if [ -r "$full_path" ]; then
      echo "The file '$file' is readable. Permissions: $permissions"
    else
      echo " The file '$file' is NOT readable. Permissions: $permissions"
    fi

    if [ -x "$full_path" ]; then
      echo " The file '$file' is executable. Permissions: $permissions"
    else
      echo " The file '$file' is NOT executable. Permissions: $permissions"
      echo " Suggestion: Run the following command to make it executable:"
      echo "   chmod +x \"$full_path\""
    fi
  else
    echo " The file '$file' does NOT exist in the folder."
  fi
else
  echo " The folder '$folder' does not exist."
fi

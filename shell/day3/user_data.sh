#!/bin/bash

echo "Enter a directory to list its contents"
read directory

echo "Contents of $directory:"
ls $directory

echo "Enter the file name to search in the directory"
read file_name

echo "Searching for $file_name in $directory:"
find $directory -name $file_name

echo "Enter a string to search inside the file"
read search_string

echo "Searching for '$search_string' in $directory/$file_name:"
grep -i "$search_string" "$directory/$file_name"
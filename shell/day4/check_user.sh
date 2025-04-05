#!/bin/bash

current_user=$(whoami)


if [ "$current_user" == "root" ]; then
        echo "You are logged in as root. Proceeding..."
elif [ "$current_user" == "ubuntu" ]; then
        echo "You are logged in as ubuntu. Proceeding..."
else
        echo "Error: You must  be either 'root' or 'ubuntu' to run this script. Can't proceed."
        exit 1
fi

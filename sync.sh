# Replace 'package_name' with the name of the package you want to check
if dpkg -l | grep -q rsync; then
    echo "Package is installed."
else
    echo "Package is not installed."
    echo "Installing package..."

    sudo apt update
    sudo apt install rsync

fi

# rsync files from source to destination
#!/bin/bash

source_dir="/mnt/c/HDD/Data Tanta uinversity Lectures & Sections"
destination_dir="/mnt/d/Data Tanta uinversity Lectures & Sections"

# Copy missing files from source to destination
rsync -av --ignore-existing "$source_dir/" "$destination_dir/"

# Copy missing files from destination to source
rsync -av --ignore-existing "$destination_dir/" "$source_dir/"

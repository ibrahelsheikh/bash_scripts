#!/bin/bash

# Check if rsync is installed
if dpkg -l | grep -q rsync; then
    echo "Rsync package is installed."
else
    echo "Rsync package is not installed."
    echo "Installing rsync package..."
    
    # Update package repository and install rsync
    sudo apt update
    sudo apt install rsync
fi

# Define source and destination directories
source_dir="/mnt/c/HDD/Data Tanta University Lectures & Sections"
destination_dir="/mnt/d/Data Tanta University Lectures & Sections" 

/mnt/c/Windows/System32/defrag.exe D: /U /V


# Sync missing files from source to destination
rsync -av --ignore-existing "$source_dir/" "$destination_dir/"

# Sync missing files from destination to source
rsync -av --ignore-existing "$destination_dir/" "$source_dir/"

/mnt/c/Windows/System32/defrag.exe D: /U /V

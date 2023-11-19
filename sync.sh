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

# Set the Internal Field Separator (IFS) to ","
IFS=','

# Create an array by reading the string using IFS
read -ra my_array <<< "$destination_dir"



/mnt/${my_array[1]}/Windows/System32/defrag.exe  /U /V


# Sync missing files from source to destination
rsync -av --ignore-existing "$source_dir/" "$destination_dir/"

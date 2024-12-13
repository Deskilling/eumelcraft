#!/bin/bash

# Define the source directory (from which to copy files)
SOURCE_DIR="EumelcraftMods"

# Define the target directory (Minecraft folder)
TARGET_DIR="$HOME/Library/Application Support/minecraft"

# Check if the source directory is provided and exists
if [ -z "$SOURCE_DIR" ]; then
    echo "Please provide a source directory."
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Delete the mods folder if it exists in the target directory
if [ -d "$TARGET_DIR/mods" ]; then
    echo "Deleting '$TARGET_DIR/mods' folder..."
    rm -rf "$TARGET_DIR/mods"
fi

# Copy all files and folders from the source directory to the target directory
echo "Copying content from '$SOURCE_DIR' to '$TARGET_DIR'..."
cp -R "$SOURCE_DIR/"* "$TARGET_DIR"

# Inform the user of completion
echo "Copy operation complete."

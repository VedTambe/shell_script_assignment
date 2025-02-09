#!/bin/bash

# Check if a directory path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

# Assign the target directory
TARGET_DIR="$1"

# Check if the specified directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory $TARGET_DIR does not exist."
  exit 1
fi

# Create the backup directory if it doesn't exist
BACKUP_DIR="$TARGET_DIR/backups"
mkdir -p "$BACKUP_DIR"

# Generate a timestamp for the backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the new backup folder
NEW_BACKUP="$BACKUP_DIR/backup_$TIMESTAMP"
mkdir "$NEW_BACKUP"

# Copy all files from the target directory to the backup folder
rsync -av --exclude "backups" "$TARGET_DIR/" "$NEW_BACKUP"

echo "Backup created at $NEW_BACKUP"

# Rotate backups: keep only the last 3 backups
BACKUPS=($(ls -d "$BACKUP_DIR"/* | sort))
BACKUP_COUNT=${#BACKUPS[@]}

if [ "$BACKUP_COUNT" -gt 3 ]; then
  REMOVE_COUNT=$((BACKUP_COUNT - 3))
  echo "Removing $REMOVE_COUNT old backup(s)..."
  for ((i = 0; i < REMOVE_COUNT; i++)); do
    echo "Deleting ${BACKUPS[$i]}"
    rm -rf "${BACKUPS[$i]}"
  done
fi

echo "Backup rotation complete."

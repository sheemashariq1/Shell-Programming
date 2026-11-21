#!/bin/bash
# Thu Oct 29 10:44:37 UTC 2026
# Archive files directly inside BASE that are larger than 2 KiB.
# Matching files are gzip-compressed, then moved into BASE/archive.
# Hidden files are included; files inside subdirectories are not.
# DAYS is currently unused, so files are not filtered by age.
# RUN=0 enables archiving; any other value skips the gzip and move steps.

# Set BASE to the directory whose files should be checked.
BASE=${1:-$HOME} // Runs on any machine with a default of the user's home directory if no argument is provided.
DAYS=10
DEPTH=1
RUN=1

# Check if the directory is present or not
if [[ ! -d $BASE ]]
then 
    echo "Directory does not exist: $BASE"
    exit 1
fi

# Create 'archive' folder if not present
if [ ! -d $BASE/archive ]
then
    mkdir $BASE/archive
fi

# Find the list of files larger than 2KiB
find "$BASE" -mtime +$DAYS -maxdepth "$DEPTH" -type f -size +2k | while read -r file
do
    if [ "$RUN" -eq 1 ]
    then
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $file ==> $BASE/archive"
        gzip "$file" && mv "$file.gz" "$BASE/archive" || exit 1
    fi
done
# To inspect the archive afterward, run: ls -la ~/archive
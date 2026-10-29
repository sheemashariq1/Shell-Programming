#!/bin/bash
# Thu Oct 29 10:44:37 UTC 2026
# Archive files directly inside BASE that are larger than 2 KiB.
# Matching files are gzip-compressed, then moved into BASE/archive.
# Hidden files are included; files inside subdirectories are not.
# DAYS is currently unused, so files are not filtered by age.
# RUN=0 enables archiving; any other value skips the gzip and move steps.

# Set BASE to the directory whose files should be checked.
BASE=/home/sheema
DAYS=10
DEPTH=1
RUN=0

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
for i in `find $BASE -maxdepth $DEPTH -type f -size +2k`
do
   if [ $RUN -eq 0 ]
   then
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
    gzip $i || exit 1
    mv $i.gz $BASE/archive || exit 1
   fi
done

# To inspect the archive afterward, run: ls -la ~/archive
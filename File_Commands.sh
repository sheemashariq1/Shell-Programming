#!/bin/bash

# To list all the contents of one file to anoter file
ls > file1.txt

# Print the contents of file1.txt to the terminal
cat file1.txt

# To overwrite the contents of file1.txt with the current date and time
date > file1.txt
cat file1.txt

echo " "
# To append the current working directory and hostname to file1.txt
pwd >> file1.txt
hostname >> file1.txt
cat file1.txt

echo " "
# To sort the contents of file1.txt and display it in the terminal
sort < file1.txt # Returns the sorted contents of file1.txt to the terminal

echo " "
# To input multiple lines of text and save it to file1.txt
cat << EOF > file1.txt
This is a multi-line string.
It can be used to display multiple lines of text.
This is the end of the multi-line string.
EOF
cat file1.txt

# If you don't want to see the output of a command on terminal or write to a file, you can redirect it to /dev/null.
# /dev/null
# It is a special file that discards all data written to it. It is often used to suppress output from commands that you don't want to see or save.

cat file1.txt &> /dev/null

# To print the current working directory to the terminal, you can use the pwd command. 
# The pwd command stands for "print working directory" and it displays the full path of the current directory you are in.
pwd

# To go to the home directory of the current user, you can use the cd command without any arguments.
# The cd command stands for "change directory" and it allows you to navigate to different directories in the file system.
cd  

# To go to the parent directory of the current directory, you can use the cd command with two dots (..) as an argument.
# The two dots represent the parent directory of the current directory.
cd ..
      # OR
cd ../

# To go to the root directory of the file system, you can use the cd command with a forward slash (/) as an argument.       
cd /

# To go to a specific directory, you can use the cd command followed by the path of the directory you want to go to.
# For example, to go to the /usr/local/bin directory, you can use the following command:
cd /usr/local/bin

# To go back to the previous directory you were in, you can use the cd command with a hyphen (-) as an argument.
# The hyphen represents the previous directory you were in.
cd -

# To check if a directory exists and create it if it doesn't
dir="/home/user/Documents/NewFolder"
if [ -d "$dir" ]  
then
  echo "Directory $dir already exists."
else
  echo "Directory $dir does not exist. Creating it now."
  mkdir -p "$dir"
fi

# To check if a file exists and create it if it doesn't
file="/home/user/Documents/NewFolder/NewFile.txt"
if [ -f "$file" ]
then
  echo "File $file already exists."
else
  echo "File $file does not exist. Creating it now."
  if touch "$file"
  then
    echo "File $file created successfully."
  else
    echo "Failed to create file $file." >&2
  fi
fi    

# To check if a file is readable, writable, and executable
if [ -r "$file" ]
then
  echo "File $file is readable."
else
  echo "File $file is not readable."
fi

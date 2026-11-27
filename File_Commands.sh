#!/bin/bash

## cat command: Display or concatenate file contents

# Display the contents of a file
cat file1.txt

# Create a new file and enter text
# Press Ctrl+D to save and exit
cat > newfile.txt


## Redirection Operators

# 1. Input Redirection (<)
# The following command takes input from a file instead of the keyboard.
wc -l < school.txt

# 2. Output Redirection (>)
# The following command stores the output in a file.
# If the file already exists, its previous contents are overwritten.
ls > output.txt

# 3. Output Redirection (>>)
# The following command appends the output to an existing file.
# The previous contents of the file are not erased.
date >> output.txt

# 4. Store the output of a command in a file
cat school.txt > copy.txt

# 5. Append the contents of one file to another
cat course.txt >> copy.txt


## touch command: Create an empty file or update its timestamps

# Create a new empty file
touch file1.txt

# Create multiple empty files
touch file2.txt file3.txt file4.txt

# Create a shell script file
touch program.sh

# Update the timestamp of an existing file
touch file1.txt

# Do not create the file if it does not exist
touch -c newfile.txt

# Update only the access time
touch -a file1.txt

# Update only the modification time
touch -m file1.txt

# Set a specific timestamp
# Example: 2026 November 28, 10:30 AM
touch -t 202611281030 file1.txt

# Set a specific timestamp including seconds
# Example: 2026 November 28, 10:30:45 AM
touch -t 202611281030.45 file1.txt


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

# The following script copies the contents of all the fi les starting with character b and which have the extension .lst 
# in the specified directory, specified by the user, into the file merge.dat.

echo -n "Enter name of directory: " 
read a
for filename in b*.lst
do
  cat $filename >> $a/merge.dat
done

# The following script prints the contents of the file with one word on each line. The filename will be passed as a command line argument.
for k in `cat "$1"`
do
    echo "$k"
done

#The following script removes the extra spaces in the lines of the file and displays them on the screen. The filename is passed as a command line argument.
cat "$1" | while read -r k
do
    echo $k  # echo command automatically removes extra spaces from its arguments
done

# The following script displays the contents of the file phone.lst on the screen after removing extra blank spaces.
while read -r k
do
    echo $k
done < phone.lst

#The following script will read line by line from one file and store it in another file after removing the extra spaces. The filenames are passed as command line arguments.
cat "$1" | while read -r k
do
    echo $k
done > "$2"

# The following script merges the three files, chapter 1, chapter 2, and chapter 3, into the file book and counts the number of lines in it.
cat school.txt > book
cat course.txt >> book
cat xyz.txt >> book
n=`cat book | wc -l`
echo "There are $n number of lines in the file book"


# wc Command (Counting Lines, Words, and Characters)
# This command count lines, words, and characters in a file.

# 1. Display the number of lines, words, and characters
wc phone.lst

# 2. Display the total number of lines in a file
wc -l phone.lst

# 3. Display the total number of words in a file
wc -w phone.lst

# 4. Display the total number of characters in a file
wc -c phone.lst


## grep Command (Searching Patterns)
# This command search for patterns in files.

# 1. Search for a string in a file
grep mce a.bat

# 2. Display the count of matching occurrences of current in bank.lst file
grep -c current bank.lst

# 3. Display filenames containing the matching pattern
grep -l current *.lst

# 4. Display line numbers along with matching lines
grep -n current bank.lst

# 5. Display all lines except those matching the pattern
grep -v current bank.lst

# 6. Ignore case while searching
grep -i current bank.lst

# 7. Search multiple files without displaying filenames
grep -h "current" *.lst

# 8. Search for a pattern containing more than one word
grep "New Delhi" file.txt

# 9. Display lines beginning with 1
grep "^1" bank.lst

# 10. Display lines ending with t
grep "t$" bank.lst

# 11. Search for current or Current
grep "[Cc]urrent" bank.lst

# 12. Search for a pattern containing any five characters followed by nt
grep ".....nt" bank.lst

# 13. Search for the pattern cu followed by any three characters and then nt
grep "cu...nt" bank.lst


## cut Command (Extracting Selected Parts of a File)
# This command extract characters and fields from a file.

# 1. Display the first 5 characters of each line
cut -c 1-5 phone.lst

# 2. Display the first character of each line
cut -c 1 phone.lst

# 3. Display characters from position 2 to 6
cut -c 2-6 phone.lst

# 4. Display characters from position 5 onwards
cut -c 5- phone.lst

# 5. Display the first field of each line
cut -d " " -f 1 phone.lst

# 6. Display the second field of each line
cut -d " " -f 2 phone.lst

# 7. Display the first and third fields
cut -d " " -f 1,3 phone.lst

# 8. Display fields from 2 to 4
cut -d " " -f 2-4 phone.lst

# 9. Extract the first field from a comma-separated file
cut -d "," -f 1 Test.csv

# 10. Extract the second field from a colon-separated file
cut -d ":" -f 2 /etc/passwd


## paste Command (Merging Lines of Files)
# This command merge lines of files.

# 1. Merge two files side by side using a tab
paste file1.txt file2.txt

# 2. Merge two files using a comma as delimiter
paste -d "," file1.txt file2.txt

# 3. Merge two files using a colon as delimiter
paste -d ":" file1.txt file2.txt

# 4. Merge all lines of a file into a single line
paste -s file1.txt

# 5. Merge all lines of a file using a comma
paste -s -d "," file1.txt

# 6. Merge three files side by side
paste file1.txt file2.txt file3.txt


# split Command (Splitting a File)
# This command split a file into smaller files.

# 1. Split a file into smaller files containing 100 lines each
split -l 100 school.txt

# 2. Split a file into smaller files containing 2 lines each
split -l 2 school.txt

# 3. Split a file into smaller files of 100 bytes each
split -b 100 school.txt

# 4. Split a file into smaller files of 10 bytes each
split -b 10 school.txt

# 5. Split a file and specify the prefix of the output files
split -l 2 school.txt part_

# 6. Split a file into smaller files with numeric suffixes
split -l 2 -d school.txt part_
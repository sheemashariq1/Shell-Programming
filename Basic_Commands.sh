#!/bin/bash

# Pipeline Command
# Syntax: command1 | command2
# The pipe symbol (|) passes the output of one command as input to another command.

# 1. Display the number of files and directories
ls | wc -l

# 2. Display the number of lines in a file
cat school.txt | wc -l

# 3. Search for a word in a file using a pipeline
cat school.txt | grep "Linux"

# 4. Convert the contents of a file into uppercase
cat school.txt | tr "a-z" "A-Z"

# 5. Display only the lines containing the word "hello"
cat school.txt | grep "hello" | wc -l

# Units Command (Unit Conversion)
# The following command converts one unit of measurement into another.
# Syntax: units 'value unit1' 'unit2'

# Example 1: Convert 5 meters to centimeters
units '5 meters' 'centimeters'

# Example 2: Convert 10 kilometers to miles
units '10 kilometers' 'miles'

# Example 3: Convert 100 Celsius to Fahrenheit
units '100 degC' 'degF'

# tr Command   (Translate)

# Convert lowercase vowels into uppercase in a file.
cat school.txt | tr "aeiou" "AEIOU"

# The following script converts a sentence to uppercase,lowercase, removes extra spaces, and counts words.
echo "Enter a sentence"
read line
echo "Upper : $(echo "$line" | tr 'a-z' 'A-Z')"
echo "Lower : $(echo "$line" | tr 'A-Z' 'a-z')"
echo "No spaces : $(echo "$line" | tr -d ' ')"
echo "Words per line:"
echo "$line" | tr ' ' '\n'

# ls Command (List Directory Contents)
# The following commands display files and directories with different options.

# 1. Display files and directories in the current directory
ls

# 2. Display all files, including hidden files, . and ..
ls -a

# 3. Display files and directories in long listing format
ls -l

# 4. Display hidden files in long listing format
ls -la

# 5. Display file sizes in human-readable format
ls -lh

# 6. Display files and directories in reverse order
ls -r

# 7. Display hidden files except . and ..
ls -A

# 8. Display files sorted by modification time (newest first)
ls -t

# 9. Display files sorted by modification time (oldest first)
ls -rt

# 10. Display directories themselves, not their contents
ls -d */

# 11. Display files and directories recursively
ls -R

# 12. Display inode numbers
ls -i

# 13. Display file sizes in blocks
ls -s

# 14. Display file types using symbols
ls -F

# 15. Display files sorted by size (largest first)
ls -S

# 16. Display files sorted by extension
ls -X

# 17. Display one entry per line
ls -1

# 18. Display all files, including hidden files, in long listing format with human-readable sizes
ls -alh


# Factor command
# This command displays the prime factors of a number.

# Example 1: Display the prime factors of 12
factor 12

# Example 2: Display the prime factors of 100
factor 100

## Command line Parameters

# The following script displays all command-line arguments.
echo "All arguments: $*"

# The following script displays the number of command-line arguments.
echo "Number of arguments: $#"

# The following script displays all command-line arguments separately.
echo "Arguments are:"
for i in "$@"
do
    echo "$i"
done

# The following script displays the process ID of the current shell.
echo "Process ID: $$"


## Wildcard Characters
# Wildcards are used to match filenames based on a pattern.

# 1. * represents any number of characters or numerals.
# Display all files whose names begin with b.
ls b*

# 2. ? represents a single character, numeral, or symbol.
# Display files whose names begin with b followed by one character.
ls b?

# 3. Display all files whose names begin with b followed by any number of characters.
ls b*

# 4. Display all files in the current directory.
ls *

# 5. Display files whose names begin with a and end with .txt
ls a*.txt


# test Command (Testing Expressions for Validity)

# 1. Check whether a file exists
if test -e school.txt
then
    echo "File exists"
else
    echo "File does not exist"
fi

# 2. Check whether a file is a regular file
if test -f school.txt
then
    echo "It is a regular file"
fi

# 3. Check whether a directory exists
if test -d Documents
then
    echo "It is a directory"
fi

# 4. Check whether a file is readable
if test -r school.txt
then
    echo "File is readable"
fi

# 5. Check whether a file is writable
if test -w school.txt
then
    echo "File is writable"
fi

# 6. Check whether a file is executable
if test -x script.sh
then
    echo "File is executable"
fi

# 7. Check whether a file is empty or non-empty
if test -s school.txt
then
    echo "File is not empty"
fi

# 8. Compare two numbers
a=10
b=20
if test $a -lt $b
then
    echo "a is less than b"
fi

# 9. Compare two strings
s1="hello"
s2="hello"
if test $s1 = $s2
then
    echo "Both strings are same"
fi

# 10. Check whether a string is empty
str=""
if test -z "$str"
then
    echo "String is empty"
fi

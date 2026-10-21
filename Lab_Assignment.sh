#!/bin/bash

# Q1: Display name with current date and time
echo -n "Enter your first name: "
read first
echo -n "Enter your last name: "
read last
for name in "$first $last"
do
    echo "Name    : $name"
    echo "Date    : $(date '+%d %b %Y')"
    echo "Time    : $(date '+%H:%M:%S')"
done

# Q2: Shell script that prints the sequence of numbers from 1 to 5. (for loop)
for i in {1..5}
do
    echo $i
done    

# Q3: Shell script that prints all filenames in the current directory beginning with 'b'. (for loop)
for file in b*; do
    if [ -e "$file" ]; then
        echo "$file"
    fi
done

# Q4: Shell script that shows the contents of all files in the current directory starting with 'b'. (for loop)
for file in b*; do
   if [ -f "$file" ]; then
        echo "=== $file ==="
        cat "$file"
        echo ""
   fi
done

# Q5: Shell script that displays the sequence of numbers from 1 to 10. (while loop)
i=1
while [ $i -le 10 ]; do
   echo $i
   i=$((i + 1))
done

# Q6: Shell script that stores the sequence of numbers from 1 to 100 in the file d.bat. (until loop)
i=1
until [ $i -gt 100 ]; do
    echo $i >> d.bat
    i=$((i + 1))
done
echo "Done. Numbers 1–100 stored in d.bat" 

# Q7: To display the list of files and directories that begin with a vowel.
ls [aeiouAEIOU]*

# Q8: To show the contents of the file mbacourse.txt along with line numberings.
cat -n mbacourse.txt

# Q9: To concatenate mbacourse.txt and lawcourse.txt and store them in career.txt.
cat mbacourse.txt lawcourse.txt > career.txt

# Q10: To remove the empty subdirectories students and teachers from the college directory.
rmdir college/students college/teachers

# Q11: To copy the entire directory teachers along with its subdirectories as faculty.
cp -r teachers faculty

# Q12: To forcibly remove the file mbacourse.txt from the college directory.
rm -f college/mbacourse.txt

# Q13: To move mbacourse.txt from the current directory to the professional subdirectory of college.
mv mbacourse.txt college/professional/

# Q14: To display day, month, and year in the format: 17 Nov 2012.
date "+%d %b %Y"

# Q15: To show files/directories beginning with any char a–z followed by exactly three characters.
ls [a-z]???

# Q16: To assign rwx to owner, rw to group, r to others for mbacourse.txt.
chmod 764 mbacourse.txt

# Q17: To display the first two lines of mbacourse.txt and management.txt.
head -n 2 mbacourse.txt management.txt

# Q18: To display lines from the 5th line till the end of mbacourse.txt.
tail -n +5 mbacourse.txt
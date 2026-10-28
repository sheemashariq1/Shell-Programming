#!/bin/bash

# Break 
# To break the loop when a specific number is found

no=6
for i in {1..10}
do
  if [ $i -eq $no ]
  then
    echo "Number $no is found!!!"
    break
  fi
  echo "Number is $i"
done

# Continue
# To print odd numbers

for i in {1..10}
do
  let r=$i%2
  if [ $r -eq 0 ]
  then
    continue
  fi
  echo "Odd number is $i"
done  

# Sleep
# To pause the execution of the script for a specific time

echo "Sleeping for 2 seconds..."
sleep 2
echo "Awake now!" 

# Exit
# To exit the script when a specific number is found  

no=8
for i in {1..10}
do
  if [ $i -eq $no ]
  then
    echo "Number $no is found!!! Exiting the script." 
    #exit 0   # Comment this out to execute the rest of the script
  fi
  echo "Number is $i"
done  

# Exit Status
# To check the exit status of the last command executed
echo "The exit status of the last command is $?"
# If the last command was successful, the exit status will be 0, otherwise it will be a non-zero value.

# Ping
# To check the connectivity to a specific host
ping -c 4 google.com
if [ $? -eq 0 ]
then
  echo "Ping successful!"
else
  echo "Ping failed!"
fi    

# To check the connectivity to a specific host entered by the user    
read -p "Which site do you want to ping? " site
ping -c 1 $site
sleep 1s
if [[$? -eq 0]]
then
  echo "Successfully connected to $site"
else
  echo "Failed to connect to $site"
fi

# Basename
# To get the base name of a file or directory
file="/home/user/Documents/file.txt"
echo "The base name of the file is $(basename $file)" 

# Dirname 
# To get the directory name of a file or directory
echo "The directory name of the file is $(dirname $file)"

# Realpath
# To get the absolute path of a file or directory
file="Names.txt"
echo "The absolute path of the file is $(realpath $file)"

# To print the name of the script being executed
echo "The name of the script is ${0}"

# If you want to print the name of the script without the path, you can use the basename command as follows:
echo "The name of the script without the path is $(basename ${0})"  

# To print the name of the script without the path and without the extension, you can use the following command:
echo "The name of the script without the path and without the extension is $(basename ${0} .sh)"  

# If you want to maintain logging for your script, you can use logger in your script.
# To log a message to the system log, you can use the following command:
logger "This is a log message from my script" 

# To view this system log file (if present; the path varies by Linux distribution):
# sudo less /var/log/messages

# Run script in background
# nohup ./Concepts.sh &

#      TO AUTOMATE OUR SCRIPT
# At or Crontab

# At Command
# For scheduling only one time
#    at 12:10 PM
#    cat file1.txt
#    ctrl+D

# atrl            # To check scheduled job
# atrm <id>       # To remove the scheduled job

# Crontab Command
#    crontab -l   # To check the existing jobs
#    crontab -e   # To add new job
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
    exit 0
  fi
  echo "Number is $i"
done  

# Exit Status
# To check the exit status of the last command executed
echo "The exit status of the last command is $?"

# Ping
# To check the connectivity to a specific host
ping -c 4 google.com
if [ $? -eq 0 ]
then
  echo "Ping successful!"
else
  echo "Ping failed!"
fi    
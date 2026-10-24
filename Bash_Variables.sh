#!/bin/bash

# Random

# A random number is generated between 0 and 32767.
echo "Random number is $RANDOM"

# To generate a random number between 1 and 100, we can use the following command:
random_number=$(( ( RANDOM % 100 ) + 1 ))
echo "Random number between 1 and 100 is $random_number"

# UID

# The UID of the current user is stored in the variable $UID.
echo "The UID of the current user is $UID"

# Check if the current user is root or not
if [ $UID -eq 0 ]
then
  echo "You are root user"
else
  echo "You are not root user"
fi  

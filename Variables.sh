#!/bin/bash
name="Sheema"
age=18
echo "My name is $name and I am $age years old."
#updating variable
name="John"
echo "My name is $name and I am $age years old."

#Trying hostname command
Hostname=$(hostname)
echo "The hostname of this machine is $Hostname."

#Constant variable
readonly PI=3.14
echo "The value of PI is $PI."  
PI=3.14159
echo "The value of PI is $PI."  # This will not change the value of PI since it is readonly

#Using environment variable
echo "The current user is $USER."      

#Using command substitution
current_date=$(date)
echo "The current date and time is: $current_date."

#Using arithmetic operations
num1=10
num2=5
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum."

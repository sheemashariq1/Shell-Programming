#!/bin/bash

# && (AND) OPERATOR
echo "Enter a number:"
read num
if [ $num -gt 0 ] && [ $num -lt 10 ]; then
    read -p "The number is between 1 and 9." response   
else
    read -p "The number is not between 1 and 9." response
fi

# || (OR) OPERATOR
echo "Enter a number:"
read num
if [ $num -lt 0 ] || [ $num -gt 100 ]; then
    read -p "The number is either less than 0 or greater than 100." response
else
    read -p "The number is between 0 and 100." response 
fi      

# ! (NOT) OPERATOR
echo "Enter a number:"
read num            
if ! [ $num -eq 0 ]; then
    read -p "The number is not zero." response
else
    read -p "The number is zero." response
fi  

## -a (AND) OPERATOR
echo "Enter a number:"
read num
if [ $num -gt 0 -a $num -lt 10 ]; then
    read -p "The number is between 1 and 9." response
else
    read -p "The number is not between 1 and 9." response       
fi
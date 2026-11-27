#!/bin/bash

# IF-ELSE STATEMENT
echo "Enter Marks:"
read marks
if [ $marks -gt 40 ]; then
    echo "You have passed the exam."
else
    echo "You have failed the exam."
fi

# ELIF STATEMENT
echo "Enter your age:"
read age
if [ $age -lt 18 ]; then
    echo "You are a minor."
elif [ $age -ge 18 ] && [ $age -lt 60 ]; then
    echo "You are an adult."
else
    echo "You are a senior citizen."        
fi      

# CASE STATEMENT
echo "Enter a number between 1 and 3:"  
read number
case $number in
    1)
        echo "You selected option 1."
        ;;
    2)
        echo "You selected option 2."
        ;;
    3)  
        echo "You selected option 3."
        ;;
    *)
        echo "Invalid option selected."
        ;;      
esac

# Another Example 
# This checks whether the input is a single letter. If the user enters multiple letters, such as abc, it will display Not a letter.
echo "Enter a single letter"
read ch
case $ch in 
     [aeiouAEIOU]) 
          echo "$ch is a vowel" ;;
     [a-zA-Z]) 
          echo "$ch is a consonant" ;;
     *) 
          echo "Not a letter" ;;
esac

# NESTED IF STATEMENT
echo "Enter a number:"
read num
if [ $num -gt 0 ]; then
    echo "The number is positive."
    if [ $((num % 2)) -eq 0 ]; then
        echo "The number is even."
    else
        echo "The number is odd."
    fi  
else
    echo "The number is not positive."
fi


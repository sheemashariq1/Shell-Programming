#!/bin/bash

# To find the length of a string in bash
myVar="Hey buddy!, how are you doing?"
myVarLength=${#myVar}
echo "The length of the myVar is: $myVarLength"

# To convert a string to uppercase and lowercase 
echo "The string in uppercase is: ${myVar^^}"
echo "The string in lowercase is: ${myVar,,}"   

# To replace a substring in a string
newVar=${myVar/buddy/Sheema}
echo "The new string after replacement is: $newVar"

# To slice a string 
# The syntax for slicing a string is ${string:position:length}
echo "The sliced string is: ${myVar:4:5}"

# To check if a string contains a substring
if [[ $myVar == *"how"* ]]; then
    echo "The string contains the substring 'how'."
else
    echo "The string does not contain the substring 'how'."
fi      

# To remove leading and trailing whitespace from a string
myVarWithSpaces="   Hello, World!   "
trimmedVar=$(echo "$myVarWithSpaces" | xargs)
echo "The trimmed string is: '$trimmedVar'" 

#To delete a substring from a string
stringToDeleteFrom="Hello, World!"
substringToDelete="World"
resultString=${stringToDeleteFrom//$substringToDelete/}
echo "The string after deleting '$substringToDelete' is: '$resultString'"

# To check if a string is empty or not
emptyString=""
if [ -z "$emptyString" ]; then
    echo "The string is empty."
else
    echo "The string is not empty."
fi  

# To check if a string is a palindrome
palindromeString="madam"
reversedString=$(echo "$palindromeString" | rev)
if [ "$palindromeString" == "$reversedString" ]; then
    echo "The string '$palindromeString' is a palindrome."
else
    echo "The string '$palindromeString' is not a palindrome."
fi

# To concatenate strings
string1="Hello"
string2="World"
concatenatedString="$string1 $string2"
echo "The concatenated string is: '$concatenatedString'"    

# To multiply a string by a number
stringToMultiply="Hello"
number=3
multipliedString=$(printf "%0.s$stringToMultiply" $(seq 1 $number))
echo "The multiplied string is: '$multipliedString'"    

# To modify a string by removing a substring
originalString="Hello, World!"
substringToRemove="World"
modifiedString=${originalString//$substringToRemove/}
echo "The modified string after removing '$substringToRemove' is: '$modifiedString'"    

# To determine the index of a substring in a string
mainString="Hello, World!"
substring="World"
index=$(expr index "$mainString" "$substring")
if [ $index -gt 0 ]; then
    echo "The index of the substring '$substring' in the string '$mainString' is: $index"
else
    echo "The substring '$substring' was not found in the string '$mainString'."
fi  



#!/bin/bash

# This script demonstrates the use of arrays in bash.   

# Declare an array
my_array=(1 2 "Hello" "Hey Sheema")

# To access the first element of the array
echo "The first element is: ${my_array[0]}"

# To access the last element of the array
echo "The last element is: ${my_array[-1]}" 

# To access all elements of the array
echo "The array elements are: ${my_array[@]}"
echo "The array elements are: ${my_array[*]}" 

# To get the number of elements in the array
echo "The number of elements in the array is: ${#my_array[@]}"
echo "The number of elements in the array is: ${#my_array[*]}"  

# To find the length of the array
echo "The length of the array is: ${#my_array[@]}"
echo "The length of the array is: ${#my_array[*]}"

# To find the length of a specific element in the array
echo "The length of the third element is: ${#my_array[2]}"

# To get the specific values from the array
# To get all values from second element to the end of the array
echo " ${my_array[*]:2}"
# To get all values from first element to the second element of the array
echo " ${my_array[*]:0:2}"

# To loop through the array elements
echo "Looping through the array elements:"
for element in "${my_array[@]}"; do
    echo "$element"
done    

# To update an element in the array
my_array[1]="Bye"
echo "Updated array elements are: ${my_array[@]}"

# To update the array with new values
my_array=("Mango" "Banana" 1.24) 
echo "Updated array elements are: ${my_array[@]}"   
echo "The number of elements in the array is: ${#my_array[@]}"

# To delete an element from the array
unset my_array[1]
echo "Updated array elements after deletion are: ${my_array[@]}"    
echo "The number of elements in the array is: ${#my_array[@]}"

# To add key-value pairs to an associative array
declare -A my_assoc_array
my_assoc_array=([name]="Sheema" [age]=18 [city]="New York")
echo "The associative array elements are: ${my_assoc_array[@]}"
echo "The number of elements in the associative array is: ${#my_assoc_array[@]}"

# To access a specific value from the associative array
# Give the key name to access the value
echo "The name is: ${my_assoc_array[name]}"

# To loop through the associative array elements
echo "Looping through the associative array elements:"
for key in "${!my_assoc_array[@]}"; do
    echo "$key: ${my_assoc_array[$key]}"
done

# To update a value in the associative array
my_assoc_array[age]=19
echo "Updated associative array elements are: ${my_assoc_array[@]}" 
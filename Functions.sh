#!/bin/bash

# To declare a function
function myfunc {
    echo "Hello Sheema"
} 
myfunc

# OR
myfunc() {
    echo "Hi Sheema"
}
myfunc

# Arguments in functions
addition() {
    local num1=$1
    local num2=$2
    let sum=$num1+$num2
    echo "Sum of $num1 and $num2 is $sum"
}
addition 10 5
addition 45 7 

# To access the arguments by taking user input
echo "All the arguments are - $@"
echo "Total number of arguments - $#"


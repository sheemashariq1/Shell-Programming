#!/bin/bash
echo "Enter two numbers:"
read num1
read num2
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum"

x=10
y=2
let mul=x*y
echo "The multiplication of $x and $y is: $mul"

echo "The subtraction of $x and $y is: $((x - y))"

echo "The division of $x and $y is: $((x / y))"

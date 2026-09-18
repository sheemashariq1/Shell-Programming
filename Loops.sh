#!/bin/bash

# For loop example
# Simple
for i in 1 2 3 4 5
do
  echo "Iteration number: $i"
done    

for i in mango banana apple
do
  echo "Fruit: $i"
done        

# For loop with a range
for i in {1..5}
do
  echo "Iteration number: $i"
done    

# C-style
for (( i=1; i<=5; i++ ))
do
  echo "Iteration number: $i"
done    

# For loop with a list of items from a file
file="Names.txt"
for name in $(cat $file)    
do
  echo "Name $((++count)): $name"
done    

# For loop with an array
fruits=("mango" "banana" "apple")
length=${#fruits[@]}
for (( i=0; i<length; i++ ))
do
  echo "Fruit: ${fruits[i]}"
done

# While loop example
# Simple
count=1
while [ $count -le 5 ]  # Run while the condition is true
do
  echo "Iteration number: $count"
  let count++   # or ((count++))
done    

# To read Content from a file line by line
file="Names.txt"
count=0
while read myline
do
  echo "Line $((++count)) : $myline"
done < "$file"  

# To read Content from a CSV file line by line
file="Test.csv"
count=0
tail -n +2 "$file" | while IFS=, read -r id name age
do
    # Skip empty lines
    [ -z "$id$name$age" ] && continue
    echo "Line $((++count)) : ID=$id, Name=$name, Age=$age"
done

# Until loop example
# Simple
count=1
until [ $count -gt 5 ]  # Run until the condition is true 
do
  echo "Iteration number: $count"
  let count++   # or ((count++))
done

# Infinite loop example
# while true
while true
do  
  echo "This is an infinite loop. Press Ctrl+C to stop."
  sleep 2s
done

# for ((;;)) is another way to create an infinite loop
for ((;;))
do
  echo "This is an infinite for loop. Press Ctrl+C to stop."
  sleep 2s
done

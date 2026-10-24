#!/bin/bash

# To debug a script, you can use the set command with the -x option. 
# This will print each command and its arguments to the terminal as they are executed, which can help you identify where the script is failing or producing unexpected results.
set -x

# If you want to exit the script when a command fails
set -e

echo "Enter your name:"
read name
echo "Hello, $name!"

cd /root


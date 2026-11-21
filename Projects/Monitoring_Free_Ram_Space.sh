#!/bin/bash

# free -h
# free -mt | grep "Total"
# free -mt | grep "Total" | awk '{print $4}'

FREE_SPACE=$(free -m | awk '/^Mem:/ {print $7}')
THRESHOLD=500

if [[ $FREE_SPACE -lt $THRESHOLD ]]
then 
echo "WARNING, RAM is running low"
else
echo "RAM is sufficient - ${FREE_SPACE} MB free"
fi
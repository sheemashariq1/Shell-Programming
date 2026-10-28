#!/bin/bash

# free -h
# free -mt | grep "Total"
# free -mt | grep "Total" | awk '{print $4}'

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')

Threshhold=500

if [[ $FREE_SPACE -lt $Threshhold ]]
then 
echo " WARNING, RAM is running low"
else
echo " RAM Space is suffient - $FREE_SPACE "
fi
#!/bin/bash

read -p "Enter sort order (3 for cpu, 4 for ram): " order

if [ $order = "3" ]
then
  echo "sorting by cpu"
elif [ $order = "4" ]
then 
  echo "sorting by ram"
else
  echo "please select either 3 or 4."
  return
fi

read -p "Enter number of processes to be displayed: " num_lines

ps aux | head -n 1
ps aux | grep $(printenv USER | cut -c 1-7 ) | sort -k $order -nr | head -n $num_lines

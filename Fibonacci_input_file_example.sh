#!/bin/sh

# for loop - version 2
for i in $(cat Fibonacci_sequence.txt);
do
  echo "The value of variable i in version 2 of the for loop is ${i}."
done

echo "The script is finished running, goodbye!"
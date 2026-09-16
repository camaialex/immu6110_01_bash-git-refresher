#!/bin/sh

# location of Fibnacci_sequence.txt
input_file_loc="/home/$USER/data/more_datasets/learning_shell"

# for loop - version 3
for i in $(cat ${input_file_loc}/Fibonacci_sequence.txt);
do
  echo "The value of variable i in version 3 of the for loop is ${i}."
done

echo "The script is finished running, goodbye!"

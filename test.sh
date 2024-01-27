#!/bin/bash

# Check if a file name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <source file>"
    exit 1
fi

# Assign the first argument as the source file
SOURCE_FILE=$1

# Compile the source file with g++
g++ -std=c++17 -O2 -Wall $SOURCE_FILE -o program.out

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

# Run the program with input.txt and save the output
./program.out < input.txt > result.txt

# Compare the resulting output with output.txt
if cmp -s result.txt output.txt; then
    echo "Success: The output matches the expected output :)"
else
    echo "Failure: The output does not match the expected output :("
    diff -y result.txt output.txt
fi

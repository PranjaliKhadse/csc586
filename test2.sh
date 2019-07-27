#!/bin/bash

Arg1=$1
re="![a-z][a-z0-9_]+$"
if [[ $Arg1 =~ $re && $Arg1 == *i* && $Arg1 != * ]]; then
echo "options and arguments ok and running in interactive mode"
exit 0
elif [[ $Arg1 == * && $Arg1 =~ $re && $Arg1 != *i* ]]; then
echo "options and arguments ok"
echo "Running in non interactive mode"
elif [[ $Arg1 =~ $re ]]; then
echo "options and argument ok running in interactive mode"
exit 0
else
echo "Err: option after an argument or wrong option 2:"
echo "Please provide correct arguments and options"
echo "Arguments list of usernames"
echo "Every username must match regex"
exit 1
fi





#!/bin/bash

Arg1=$1
re="[a-z][a-z0-9_]+$"
if [[ ! -n =~ $re ]]; then
echo "options and arguments ok and running in interactive mode"
exit 0
elif [[ ! -n =~ $re ]]; then
elif [[ -n == *i* ]]; then
elif [[ -n == * ]]; then
echo "options and argument ok running in interactive mode"
exit 0
else
echo "Err: option after an argument or wrong option 2:"
echo "Please provide correct arguments and options"
echo "Arguments list of usernames"
echo "Every username must match regex"
exit 1
fi



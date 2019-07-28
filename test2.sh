#!/bin/bash

Arg1=$1
re="^[a-z][a-z0-9_]*$"
if [[ $# -eq 0 ]]; then
echo "Please provide correct arguments and options"
echo "Usage: ./check_arg.sh[-i][-n][USERS]"
echo "Options(Optional):-i or -n for interactive or non-interactive mode"
echo "Arguments :list of usernames"
echo "Every username must match this regular expression: '^[a-z][a-z0-9_]*$' "
exit 0
elif [[ ! $Arg1 =~ $re && $Arg1 == *i* && $Arg1 != * ]]; then
echo "Options and arguments ok and running in interactive mode"
exit 0
elif [[ $Arg1 == * && ! $Arg1 =~ $re && $Arg1 != *i* ]]; then
echo "options and arguments ok"
echo "Running in non interactive mode"
elif [[ ! $Arg1 =~ $re ]]; then
echo "options and argument ok running in non-interactive mode"
exit 0
else
echo "Err: option after an argument or wrong option 2:"
echo "Please provide correct arguments and options"
echo "Arguments list of usernames"
echo "Every username must match regex"
exit 1
fi




#!/bin/bash

if [[ $# -eq 0 ]]; then 
echo "Please provide correct arguments and options"
echo "Usage: ./check_arg.sh[-i][-n][USERS]"
echo "Options(optional):-i or -n for interactive or non-interactive execution"
echo "Arguments :list of users names"
echo "every user name must match this regular expression '^[a-z][a-z0-9_]*$'"
exit 0 
elif [ $# -gt 1 ]; then

for i in "${@:2}"; do
if [[ $i=~^[a-z][a-z0-9_]*$ ]]; then
if [[ $1="-i" ]]; then
echo "Options and arguments okay"
echo "Runining in interactive mode"

elif [[ $1="-n" ]]; then
echo "options and arguments okay"
echo "Running in non-interactive mode"
else 
echo "ERR:options after an argument or wrong argument or wrong option 2:"$2
echo "Please provide correct arguments and options"
echo "Arguments : list of user names"
echo "Every useer name must match this regular Exp:'^[a-z][a-z0-9_]*$'"
fi
else
echo "ERR: options after an argument or wrong argument or wrong option 2:"$2
echo "please provide corrrect arguments and options"
echo "Arguments : list of user names"
echo "Every user name must match this reglar exp:'^[a-z][a-z0-9_]*$'"
fi
done
elif [[ $# -ge 1 ]]; then
for i in "${@:2}"; do
if [[ $i=~^[a-z][a-z0-9_*$ ]]; then
echo "options and arguments okay"
echo " Running in interactive mode"
else
echo  "ERR:options after an argument or wrong argument or worng option 2:"$2
echo "please provide correct arguments and options"
echo "Arguments :list of user names"
echo  "Every user name must match this regular exp:'^[a-z][a-z0-9_]*$'"
fi
done
fi


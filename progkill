#! /bin/bash

echo -e "Please enter the name of the program you want to kill\n\n"

read progname

echo -e "\nkilling $progname"

ps ax | grep $progname | awk '{print $1}' | xargs kill -9
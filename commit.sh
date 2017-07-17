#!/bin/bash

# commits a change and pushes a change
git add --all;

printf "\nHello "$USER". please enter the commit message: "

read msg

git commit -m "$msg"

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

printf "\nPlease enter the name of the upstream remote\n\nOr type Enter to push to current branch that you are on\n\n "

read remote

if [ remote == "" ]; then
   remote=parse_git_branch
fi

git push -u origin $remote

printf "\n\n"

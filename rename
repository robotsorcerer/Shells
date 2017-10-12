#!/bin/bash

printf "\n\nenter unique portion of filenames you want to change.\ne.g. '*.jpg'"
read files

echo -e "enter the portion of the filenames you want to substitute\n"
read portion

echo -e "now enter the replacement\n"
read replace

for x in $files; do mv $x "${x/$portion/$replace}"; done


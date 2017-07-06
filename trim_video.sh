#!/bin/bash

echo -e "enter input filename: \n"
read infile

echo -e "enter output filename: \n"
read outfile

echo -e "enter start of trim in format [hh:mm:ss]:\n"
read start

echo -e "enter end of trim [in format hh:mm:ss]:\n"

read end

ffmpeg -i $infile -ss $start -t $end -strict -2 -async 1 $outfile

echo -e "would ya like to remove old file? [y|n]: \n"
read resp

if [[ $resp == "y" ]]; then
   rm $infile
fi


cat <<-EOT

finished trimming video file $infile into $outfile

EOT




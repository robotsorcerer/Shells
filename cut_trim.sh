#!/bin/bash

# this speeds up a video and trims it with ffmpeg
echo -e "enter file you want to speed up: \n"
read infile

filename="${infile%.*}"
ffmpeg -i $infile -r 16 -filter:v "setpts=0.25*PTS" -strict -2 $infile"_4x.mp4"

echo -e "enter start of trim in format [hh:mm:ss]:\n"
read start

echo -e "enter end of trim [in format hh:mm:ss]:\n"

read end

wait
ffmpeg -i $infile"_4x.mp4" -ss $start -t $end -strict -2 -async 1 $infile"_4x_cut.mp4"

wait
rm $infile"_4x.mp4"

echo -e "would ya like to remove old file? [y|n]: \n"
read resp

if [[ $resp == "y" ]]; then
   rm $infile
   mv $infile"_4x_cut.mp4" $infile
elif [[ $resp == "n" ]]; then
	mv $infile"_4x_cut.mp4" $filename"_spedcut.mp4"
else  
	echo -e "you have entered an invalid response\n"
fi

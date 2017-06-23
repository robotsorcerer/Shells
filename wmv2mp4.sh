#! bin/bash
for f in *.wmv;
do	ffmpeg -i "$f" -c:v libx264 -crf 18 -preset medium \
	-c:a libfdk_aac -vbr 5 -movflags +faststart -vf scale=-2:720, \
	format=yuv420p encoded/"${f%.avi}.mp4";
done"
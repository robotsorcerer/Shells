#!/bin/bash
echo -e "enter input filename:\n"
read input

echo -e "enter output filename:\n"
read output

ffmpeg -i input -b:v 8000k -strict -2 output


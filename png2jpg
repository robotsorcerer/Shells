#!/bin/bash

set -e

while getopts df: OPTION "$@"; do
    case $OPTION in
    d)
        set -x
        ;;
    f)
        PNGFILE=${OPTARG}
        ;;
    esac
done

if [[ -z "$PNGFILE" ]]; then
    echo "usage: `basename $0` [-d] -f <pngFile>"
    exit 1
fi


export temp_name="$PNGFILE.jpg"
convert $PNGFILE $temp_name

newfile="${temp_name/.png.jpg/.jpg}" 
mv $temp_name "$newfile"

#rm $temp_name

echo "

Successfully renamed $PNGFILE to $newfile"



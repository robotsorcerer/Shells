#!/bin/bash
#
rm *.patch; 

cd ~/Dropbox/ogunmolu/CV
$rm Resume_Work.tex.rej *.patch *.pdf 
wait

diff -u ../../F16/Resume/Resume_Work.tex Resume_Work.tex > cv.patch
wait

patch -N Resume_Work.tex cv.patch --verbose
printf '\n ignoring patches that appear to be reversed or already applied\n'
wait

printf '\n\n Thanks! All done\n'
texliveonfly Resume_Work.tex
wait

printf '\n\n cleaning up directory\n\n'
$rm *.log *.aux  *.out  *.gz
wait

printf '\n\n show what you got:\n\n'
cd ~/Dropbox/F16/Resume/ &&
okular Resume_Work.pdf
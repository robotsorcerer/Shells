#!/bin/bash
# farnn cloner
git init ;
wait
git remote add origin -f https://github.com/service-lab/superchicko;
wait
git config core.sparsecheckout true ;
wait
echo "farnn/*" >> .git/info/sparse-checkout;
wait
git pull --depth=4 origin indigo-devel;

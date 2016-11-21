#! /bin/bash
#git config myne
git config --global user.name lakehanne
git config --global user.email patlekano@gmail.com
git config --global core.editor sublime-text
git config --list			# will display the above info in terminal

printf '\n\n Cache the password\n\n'
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
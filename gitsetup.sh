#! /bin/bash
#git config myne
git config --global user.name lakehanne
git config --global user.email patlekano@gmail.com
git config --global core.editor sublime-text
git config --list			# will display the above info in terminal

printf '\n\n Cache the password\n\n'
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

#do git push mode to matching
git config --global push.default matching

#add ssh keygen
ssh-keygen -t rsa -b 4096 -C "patlekano@gmail.com"
wait

#add key to  ssh agent
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

if hash xclip 2>/dev/null; then
    xclip -sel clip < ~/.ssh/id_rsa.pub
else
    install xclip;
    xclip -sel clip < ~/.ssh/id_rsa.pub
fi

echo "you may now paste the ssh keys in your window"
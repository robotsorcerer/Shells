#! /bin/bash

printf '\n\nEnter Directory to copy from on local machine\n\n'

read from

printf '\n\nEnter Directory to copy from to on remote machine\n\n'

read to

echo -e "\n\nYou are copying from \n\n\t$from \n to \n\t $to.\n\n Is this correct?"

read answer


is_yes() {
	yesses={y,Y,yes,Yes,YES}
	if [[ $yesses =~ $1 ]]; then
		echo 1
	fi
	}

is_no() {
        noses={n,N,no,No,No}
        if [[ $noses =~ $1 ]]; then
                echo 1
        fi
        }

if [ $(is_yes $answer)  ]; then
	scp -r $from  pi@205.208.91.240:$to
else
	echo -e "command not understood"
fi   

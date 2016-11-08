#!/bin/bash
#Use this to check the progress of dd clone in terminal
while [[ true ]]; do
	sudo dd if=/dev/sda of=/dev/sdc& pid=$!;

	sudo kill -USR1 $pid; sleep 1; #kill $pid
	sleep 5;
	date
done


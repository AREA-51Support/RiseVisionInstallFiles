#!/bin/bash

restarts="$(cat output.txt)"
if [ $restarts = "0" ]; then
	echo "1" > output.txt;
	sudo sed -i -e '$i \/home/pi/restartCount.sh &\n' /etc/rc.local;
fi

if [ $restarts = "1" ]; then
	echo "2" > output.txt
fi

if [ $restarts = "2" ]; then
	rm output.txt
	sudo sudo sed -i '/restartCount/d' /etc/rc.local
fi

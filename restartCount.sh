#!/bin/bash



restarts="$(cat output.txt)"
if [ $restarts = "0" ]; then
	mkdir /home/pi/.config/
	mkdir /home/pi/.config/autostart
	printf "[Desktop Entry]\nName=Installer\nExec=/home/pi/start-installer.sh\nType=application" >> /home/pi/.config/autostart/installer.desktop
	echo "Creating Desktop File"

	echo "1" > output.txt;
	sudo sed -i -e '$i \/home/pi/restartCount.sh &\n' /etc/rc.local;
fi

if [ $restarts = "1" ]; then
	echo "2" > output.txt

fi

if [ $restarts = "2" ]; then
	rm output.txt
	sudo sudo sed -i '/restartCount/d' /etc/rc.local
	rm /home/pi/.config/autostart/installer.desktop
fi

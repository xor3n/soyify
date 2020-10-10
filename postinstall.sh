#!/bin/bash

# yes
echo "need root"

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ $(id -u) != 0 ]]
then
   echo -e ""$E"Permission denied!"
   exit
fi

sleep 0.5
clear
sleep 0.5

echo -e "Welcome to postinstall.sh, this will clear all bloat and do any necessary configuration. This is optional, if you wish to keep your old desktop environment, terminal emulator and file manager, feel free to ctrl + c and enjoy your newly set up environment."

sleep 0.2

echo -e "Enter [yes] or [no] to continue"

read choice

case $choice in
	yes)
		bash bloatdestroyer.sh
	;;

	no)
		echo -e "All current files will remain, run this at any time to avoid that."
	;;
esac

#!/bin/bash

# removes packages that were replaced by other packages

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

echo -e "this script will remove all things replaced by setup.sh and will run your package managers autoclean, this script is optional as some users may desire to keep their old software, feel free to skip but know that this will result in wasted space."
echo -e "IMPORTANT: Do not fret if there are error messages about packages not being found, this is normal as some users may have different packages to another"
echo -e "enter your package manager:"

read pacm

case $pacm in

	apt)
		#remove all file managers
		apt-get autoremove --purge dolphin*
		apt-get autoremove --purge nautilus*
		apt-get autoremove --purge konqueror*
		apt-get autoremove --purge nemo*
		apt-get autoremove --purge thunar*
		echo -e "if you are aware of any other file managers installed, feel free to type the name and have them automatically removed, if not; just hit enter and keep going!"
		read fman
		apt-get autoremove --purge $fman*
		#remove desktop environment
		apt-get autoremove --purge gdm3*
		apt-get autoremove --purge gnome*
		apt-get autoremove --purge kde-full*
		apt-get autoremove --purge xfce4*
		echo -e "if you are aware of any other desktop environment installed, feel free to type the name of the package and have it automatically removed, if not; just hit enter and keep going!"
		apt-get autoremove --purge x-terminal-emulator*
		apt-get autoremove --purge konsole*
		apt-get autoremove --purge gnome-terminal*
		echo -e "if you are aware of any other terminal emulator installed, feel free to enter the package name and have automatically removed, like before, just hit enter if this is incorrect."
		apt-get autoremove
		echo -e "bloat, destroyed."

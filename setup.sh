#!/bin/bash

# installs the necessary packages

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

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then
   echo -e ""$E"No Internet connection!"
   exit
fi

sleep 0.5
clear
sleep 0.5

# confirm operating system/distribution
echo -e "enter your package manager, if you want to compile from source, just enter compile, if you don't know what a package manager is, type ?"

read OS

case $OS in

  apt)
    	# add backports so that polybar can be installed
	echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list
	apt-get update && apt-get -y install bspwm sxhkd rofi polybar ranger vim git
    ;;

  pacman)
	pacman -Sy && pacman -S --noconfirm bspwm sxhkd rofi polybar ranger vim git
    ;;

  yum)
	yum update && yum -y install bspwm sxhkd rofi polybar ranger vim git
    ;;

  eopkg)
	eopkg update-repo && eopkg -y install git sxhkd rofi polybar ranger vim
    ;;

  xbps)
	xbps-install -S && xbps-install -y bspwm sxhkd rofi polybar vim git
   ;;

  apk)
	apk update && apk add bspwm sxhkd rofi polybar ranger vim git
    ;;

  brew)
	brew upgrade && brew install bspwm sxhkd rofi polybar ranger vim git
    ;;

  compile)
	git clone https://github.com/baskerville/bspwm.git
	cd bspwm
	make clean install
	git clone https://github.com/baskerville/sxhkd.git
	cd sxhkd
	make clean install
	git clone https://github.com/davatorium/rofi.git
	cd rofi
	make clean install
	git clone https://github.com/polybar/polybar.git
	cd polybar
	make clean install
	git clone https://github.com/ranger/ranger.git
	cd ranger
	make clean install
    ;;

   pkg)
	pkg upgrade && pkg install bspwm sxhkd rofi polybar ranger vim git
    ;;
    
   dnf)
   	dnf upgrade && dnf install bspwm sxhkd rofi polybar ranger git
    ;;
    
    portage)
    	emerge -uDU --keep-going --with-bdeps=y @world	
    	emerge --ask x11-wm/bspwm
	emerge --ask x11-misc/sxhkd
	emerge --ask x11-misc/rofi
	emerge --ask x11-misc/polybar
	emerge --ask app-misc/ranger
     ;;
esac

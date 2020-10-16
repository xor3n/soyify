#!/bin/sh

POSIXLY_CORRECT=1

# installs the necessary packages

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [ $(id -u) != 0 ]
then
   echo ""$E"Permission denied!"
   exit
fi

sleep 0.5
clear
sleep 0.5

# confirm operating system/distribution
echo "enter your package manager, if you want to compile from source, just enter compile, if you don't know what a package manager is, type ? NOTE: an internet connection is expected."

read -p "PACKET MANAGER -----> " OS

case $OS in
  "?")
	clear
	echo "Packet manager is used to update and install new things into your system"
	echo 'Noticiable packet managers : "apt" "brew" "pacman" "yum" '
	echo 'ON the option "PACKET MANAGER" you have to select your packet manager'
	echo "Example:  apt"
	sleep 8
	./setup.sh
    ;;
  "apt")
    	# add backports so that polybar can be installed
	echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list
	apt-get update && apt-get -y install bspwm sxhkd rofi polybar ranger vim git
    ;;

  "pacman")
	pacman -Sy && pacman -S --noconfirm bspwm sxhkd rofi polybar ranger vim git
    ;;

  "yum")
	yum update && yum -y install bspwm sxhkd rofi polybar ranger vim git
    ;;

  "eopkg")
	eopkg update-repo && eopkg -y install git sxhkd rofi polybar ranger vim
    ;;

  "xbps")
	xbps-install -S && xbps-install -y bspwm sxhkd rofi polybar vim git
   ;;

  "apk")
	apk update && apk add bspwm sxhkd rofi polybar ranger vim git
    ;;

  "brew")
	brew upgrade && brew install bspwm sxhkd rofi polybar ranger vim git
    ;;

  "compile")
	mkdir /tmp/xdbars-resources && cd /tmp/xdbars-resources
	git clone https://github.com/baskerville/bspwm 
	git clone https://github.com/baskerville/sxhkd
	git clone https://github.com/yshui/picom
	git clone https://github.com/davatorium/rofi
	git clone https://github.com/polybar/polybar
	cd .. && sudo make install /tmp/xdbars-resources
    ;;

   "pkg")
	pkg upgrade && pkg install bspwm sxhkd rofi polybar ranger vim git
    ;;
    
   "dnf")
   	dnf upgrade && dnf install bspwm sxhkd rofi polybar ranger git
    ;;
    
    "portage")
    	emerge -uDU --keep-going --with-bdeps=y @world	
    	emerge --ask x11-wm/bspwm
	emerge --ask x11-misc/sxhkd
	emerge --ask x11-misc/rofi
	emerge --ask x11-misc/polybar
	emerge --ask app-misc/ranger
    ;;
    *)
	clear
	echo "!ERROR! This packet manager does not exist !"
	sleep 3
	./setup.sh
    ;;
esac

sleep 3
clear
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo 'If you typed your packet manager and it said : "command not found" its because the packet manager you selected its not yours'
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "###################################################|SETUP COMPLETED|########################################################"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"



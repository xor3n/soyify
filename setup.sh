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
	apt-get update
	apt-get -y install bspwm
	apt-get -y install sxhkd
	apt-get -y install rofi
    	apt-get -y install polybar
    ;;

  pacman)
	pacman -Sy
	pacman -S --noconfirm bspwm
	pacman -S --noconfirm sxhkd
	pacman -S --noconfirm rofi
	pacman -S --noconfirm polybar
    ;;

  yum)
	yum -y install git
	yum -y install sxhkd
	yum -y install rofi
	yum -y install polybar
    ;;

  eopkg)
	eopkg update-repo
	eopkg -y install git
	eopkg -y install sxhkd
	eopkg -y install rofi
	eopkg -y install polybar
   ;;

  xbps)
	echo "which libc are you using? [glibc] [musl]"

	read libc

	if [ $libc == musl ]
	then
		xbps-install -S
		xbps-install -y bspwm
		xbps-install -y sxhkd
		xbps-install -y rofi
		xbps-install -y polybar
	fi

	if [ $libc == glibc ]
	then
		xbpx-install -S
		xbps-install -y bspwm
		xbps-install -y sxhkd
		xbps-install -y rofi
		xbps-install -y polybar
	fi
   ;;

  apk)
	apk update
	apk add bspwm
	apk add sxhkd
	apk add rofi
	apk add polybar
    ;;

  brew)
	brew update
	brew upgrade
	brew install bspwm
	brew install sxhkd
	brew install rofi
	brew install polybar
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
    ;;

   pkg)
	pkg upgrade
	pkg install bspwm
	pkg install sxhkd
	pkg install rofi
	pkg install polybar
    ;;
    
   dnf)
   	dnf install bspwm
	dnf install sxhkd
	dnk install rofi
	dnf install polybar
    ;;
esac

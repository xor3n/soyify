
#!/bin/bash
# install the necessary packages

# yes
echo "need root"

# add backports so that polybar can be installed
echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list

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
echo -e "enter your package manager, if you don't know what a package manager is, type ?"
read OS

if [ $OS == ? ]
then
	echo "it's that thing you use to install stuff ok"
fi

if [ $OS == apt ]
then
	apt-get update
	apt-get -y install bspwm
	apt-get -y install sxhkd
	apt-get -y install rofi
	apt-get -y install polybar
fi

if [ $OS == pacman ]
then
	pacman -Sy
	pacman -S --noconfirm bspwm
	pacman -S --noconfirm sxhkd
	pacman -S --noconfirm rofi
	pacman -S --noconfirm polybar
fi

if [ $OS == zypper ]
then
	zypper refresh
	zypper install -y bspwm
	zypper install -y sxhkd
	zypper install -y rofi
	zypper install -y polybar
fi

if [ $OS == yum ]
then 
	yum -y install git
	yum -y install sxhkd
	yum -y install rofi
	yum -y install polybar
fi

if [ $OS == eopkg ]
	eopkg update-repo
	eopkg -y install git
	eopkg -y install sxhkd
	eopkg -y install rofi
	eopkg -y install polybar
fi

if [ $OS == xbps ]
	xbps-install -S
	xbps-install -y bspwm
	xbps-install -y sxhkd
	xbps-install -y rofi
	xbps-install -y polybar
fi

sleep 1
echo -e ""$S"The Setup Is Completed Now You Can Run The Tool!"
sleep 1

# install shit
sudo apt -t buster-backports install polybar
apt install bspwm sxhkd rofi feh

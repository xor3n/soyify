#!/bin/bash

printf '\033]2;Setup.sh\a'

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
{
git clone https://github.com/busyloop/lolcat
cd lolcat/bin
gem install lolcat
}
sleep 10
cat banner/banner.txt | lolcat
echo

sleep 1
echo -e ""$G"Installing All The Necessary Packages"
sleep 1

{
apt-get update
apt-get -y install bspwm
apt-get -y install sxhkd
apt-get -y install rofi
apt-get -y install polybar
pacman -Sy
pacman -S --noconfirm bspwm
pacman -S --noconfirm sxhkd
pacman -S --noconfirm rofi
pacman -S --noconfirm polybar
zypper refresh
zypper install -y bspwm
zypper install -y sxhkd
zypper install -y rofi
zypper install -y polybar
yum -y install git
yum -y install sxhkd
yum -y install rofi
yum -y install polybar
dnf -y install git
dnf -y install sxhkd
dnf -y install rofi
dnf -y install polybar
eopkg update-repo
eopkg -y install git
eopkg -y install sxhkd
eopkg -y install rofi
eopkg -y install polybar
xbps-install -S
xbps-install -y bspwm
xbps-install -y sxhkd
xbps-install -y rofi
xbps-install -y polybar
} &> /dev/null

sleep 1
echo -e ""$S"The Setup Is Completed Now You Can Run The Tool!"
sleep 1

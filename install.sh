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

sleep 0.5
clear
sleep 0.5

echo -e "Thanks for using xdbars, enjoy the feeing of being a true soydev with you're epic tiling wm rice and CLI file manager, we hope it feel the void in your heart."

sleep 0.5

#install needed packages
echo -e "This will install all needed packages (st, bspwm, sxhkd, ranger, polybar and rofi) to provide you with a fully functional yet minimal system. Without these installed deploy.sh won't work properly and then running bloatdestroyer.sh will give you a broken system (this is bad), that is why we highly recommend running this. Remember, you can cncel at any time with "ctrl + c"

bash 

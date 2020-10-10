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
sleep 0.5
echo -e "IMPORTANT: Run this sript from your newly set up terminal emulator: st"
sleep 0.5
echo -e "IMPORTANT: Do not fret if there are error messages about packages not being found, this is normal as some users may have different packages to another"
sleep 0.5
echo -e "enter your package manager:"

read pacm

case $pacm in

	apt)
		#remove all extra file managers
        	echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
        	read fman
        	apt-get autoremove --purge $fman*

		#remove desktop environment
        	echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
        	read b
        
		if [ $DEWM == list ]
		then
			echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
		else
        		apt-get autoremove --purge $DEWM*
		fi
		
		#remove old terminal emulator
		echo -e "time to remove your old terminal emulator, just enter the package name and off we go"	
		read TE
		apt-get autoremove --purge $TE*
		
		#remove unecessary packages found in debian distros
		apt-get autoremove --purge aptitude bc nano tcsh w3m zip mutt foomatic-filters vim-tiny vi hplip ncurses-term smclient ssh unzip tasksel vim-common wamerican whois
		
		apt-get autoremove
		echo -e "bloat, destroyed."
	  ;;
	  
	pacman)
                echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                pacman -R $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM
		
                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        pacman -R $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                pacman -R $TE

                pacman -Rsn $(pacman -Qdtq)
                echo -e "bloat, destroyed."
	  ;;	
	
	yum)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                yum remove $fman

		#remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        yum remove $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                yum remove $TE

                yum remove `package-cleanup --leaves`
		yum remove `package-cleanup --leaves`
		yum remove `package-cleanup --leaves`
                echo -e "bloat, destroyed."
	  ;;	
		
	eopkg)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                eopkg remove $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        eopkg remove $DEWM
                fi
		
                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                eopkg remove $TE
		
		eopkg remove-orphans
                echo -e "bloat, destroyed."
	  ;;	
	
	xbps)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                xbps-remove $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        xbps-remove $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                xbps-remove $TE

                xbps-remove -o -O
                echo -e "bloat, destroyed."
	 ;;	
	
	apk)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                apk del $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        apk del $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                apk del $TE
		
                echo -e "bloat, destroyed."
         ;; 
	 
	brew)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                brew remove $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        brew remove $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                brew delete $TE
		
		brew cleanup
                echo -e "bloat, destroyed."
	  ;;
	  
	pkg)
		echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                pkg remove $fman

		#remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM
		
                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        pkg delete $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                pkg remove $TE
		
		pkg -y autoremove
                echo -e "bloat, destroyed."
	   ;;
	 
	 dnf)
	 	echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                dnf remove  $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        dnf remove $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                dnf remove $TE

                echo -e "bloat, destroyed."                echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                dnf remove $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        dnf remove $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                dnf remove $TE
		
		dnf autoremove
                echo -e "bloat, destroyed."
		
	   portage)
	   	echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                emerge --deselect $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name, if you need a list of common ones, enter list"
                read DEWM

                if [ $DEWM == list ]
                then
                        echo -e "gnome = gdm3 and gnome, kde = kde-full, xfce = xfce4, i3 = i3, lxde = lxde"
                else
                        emerge --deselect $DEWM
                fi

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                emerge --deselect $TE
		
		emerge --depclean -vp
                echo -e "bloat, destroyed."
esac

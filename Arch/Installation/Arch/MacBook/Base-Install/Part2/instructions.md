# Linux-Stuff

# OK. So part one has been done and the system has been rebooted.
# You have logged in to the system and are presented with a prompt.

# So. Let's begin with part 2 of the install.

	1. First of all, we have to install a couple of firmwares or mkinitcpio will keep complaining. So enter the following command:
	
		yaourt -S aic94xx-firmware wd719x-firmware
	

	2. This will install the required firmware and then we have to issue the following command to let mkinitcpio know of
	   it.

		sudo mkinitcpio -p linux
	
		Note that we used sudo this time since we are no longer root and we need root access for this command.
	

	3. Now with the firmware setup completed, let's install a couple cool fonts shall we. Issue the following command:

		sudo pacman -S ttf-dejavu ttf-inconsolata adobe-source-code-pro-fonts
	

# Desktop Environment.

	4. Now that we have some fonts ready at our disposal, it's time to install a Desktop Environment!!


	5. For this tutorial, I will be installing Mate Desktop Environment. And it works best with MSI Laptop because of
	   hasstle free volume/brightness shortcuts and toggles.


	6. OK, so, to install Mate environment, we run the following command:

		sudo pacman -S xorg mate mate-extra blueman mate-power-manager system-config-printer network-manager-applet
		mate-media lightdm
	

	7. This will install all the packages required for us. But we need a greeter for lightdm as well. So we install
	   webkit2 greeter for lightdm because it looks best.

	   	yaourt -S lightdm-webkit2-greeter
	

	8. Now we go to lightdm settings and enable the webkit2 greeter.

		sudo nano /etc/lightdm/lightdm.conf

	9. Find [Seat: *] without the comment (#) and find greeter-session key in that section. Remove the comment from that
	   line and set it as follows:

	   	greeter-session=lightdm-webkit2-greeter
	

	10. Now, we are done with lightdm configuration. So we enable the lightdm to be started automatically at boot.

		sudo systemctl enable lightdm
	

	11. Finally, we reboot the system. The Desktop Environment is installed now.

	
	12. Now, when the system reboots, we have lightdm loaded and showing time at center. Press enter or click the time
		and you will be greeted with your username and it will ask for your password.
	
	
	13. Enter your password and click on the bottom arrow on the left of the dialog. Choose Mate from the drop down
		list. This is a one time process and lightdm will remember the choice of Desktop Environment now.
	

	14. Log in to the system.

	15. Install mpbfan-git AUR package and enable the mbpfan service to prevent laptop overheating.

	16. Install xf86-input-mtrack-git AUR package for proper touchpad support, using the following config in /etc/X11/xorg.conf.d/00-touchpad.conf:
		Section "InputClass"
			MatchIsTouchpad "on"
    			Identifier      "Touchpads"
    			Driver          "mtrack"
    			Option          "Sensitivity" "0.64"
    			Option          "FingerHigh" "5"
    			Option          "FingerLow" "1"
    			Option          "IgnoreThumb" "true"
    			Option          "IgnorePalm" "true"
    			Option          "DisableOnPalm" "true"
    			Option          "TapButton1" "1"
   			Option          "TapButton2" "3"
    			Option          "TapButton3" "2"
    			Option          "TapButton4" "0"
    			Option          "ClickFinger1" "1"
    			Option          "ClickFinger2" "2"
    			Option          "ClickFinger3" "3"
    			Option          "ButtonMoveEmulate" "false"
    			Option          "ButtonIntegrated" "true"
    			Option          "ClickTime" "25"
    			Option          "BottomEdge" "30"
    			Option          "SwipeLeftButton" "8"
    			Option          "SwipeRightButton" "9"
    			Option          "SwipeUpButton" "0"
    			Option          "SwipeDownButton" "0"
    			Option          "ScrollDistance" "75"
    			Option          "VertScrollDelta" "-111"
    			Option          "HorizScrollDelta" "-111"
		EndSection

	17. Refer to https://wiki.archlinux.org/index.php/Apple_Keyboard for setting up the apple keyboard. Note that modprobe.d directory cannot (apparently) have symbolic links.

	18. Install and enable cpupower, thermald, and powertop. The service for powertop is:
		[Unit]
		Description=Powertop Service

		[Service]
		Type=oneshot
		ExecStart=/usr/bin/powertop --auto-tune

		[Install]
		WantedBy=multi-user.target

	19. Set cpupower governer to powersave -

		cpupower frequency-set -g powersave

# This is the end of Part 2 of base system install. Next, we will install some other softwares and customize the system more.

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


	6. OK, so to install Mate environment, we run the following command:

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
	

	14. Finally, log in to the system! You are done!


# This is the end of Part 2 of base system install. Next, we will install some other softwares and customize the system more.

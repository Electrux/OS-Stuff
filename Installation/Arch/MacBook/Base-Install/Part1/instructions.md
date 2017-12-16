# Linux-Stuff

Installing Arch linux on an MSI laptop Part 1.


# Prerequisites

	1. Working Internet connection.
	2. Arch Linux ISO burnt to a USB using etcher for linux or rufus for windows.
	3. Laptop to install arch linux in (Duh!)


# Starting the installation

	1. Boot up the laptop and disable the SecureBoot in BIOS otherwise Arch won't boot.


	2. Now boot the laptop with Arch USB drive.


	3. After Arch loads, you will be greeted with a shell with something like:

		root@archiso#


	4. Now first, setup the time and date synchronization with NTP servers using command:

		timedatectl set-ntp true


	5. Now we will create a GPT type partition table for the hard drive using fdisk utility.

		5.a Open the fdisk utility with the hard drive as parameter (/dev/sda for me).
		5.b Press g and then press enter. This will create a new GPT table for the drive.
		5.c Press w and then press enter. This will save the partition table and exit.


	6. Next, we will create the partitions for the hard drive. This will be done using cgdisk utility.


		NOTE: Our partition scheme will be as follows (for a 1TB drive).
			
			Partition id		Partition type		Partition size		Partition label
			/dev/sda1		ef00 (efi)		1G			boot
			/dev/sda2		8300 (default)		50G			root
			/dev/sda3		8300 (default)		30G			var
			/dev/sda4		8300 (default)		384G			home
			/dev/sda5		8300 (default)		450G			data
			/dev/sda6		8200 (linux swap)	16.5G			swap

		6.a Open the cgdisk utility using the hard drive as the parameter (/dev/sda for me).
		6.b Select free space and press [New].
		
			6.b.a For Starting Sector, simply press enter.
			6.b.b For Ending Sector, enter the size of the first partition (1G).
			6.b.c For Partition Type, enter partition type for the first partition (ef00).
			6.b.d For Partition Label, enter partition label for the first partition (boot).

			This will create our first partition on the hard drive which is the boot partition.
		6.c Repeat the steps above for all the other partitions. Hence our partition scheme will be formed.


	7. Next, we format the partitions to be able to use them.
	
		7.a Format the boot partition as vfat:
		
			mkfs.vfat /dev/sda1

		7.b Format the root, var, home, and data as xfs:

			mkfs.xfs /dev/sda2
			mkfs.xfs /dev/sda3
			mkfs.xfs /dev/sda4
			mkfs.xfs /dev/sda5

		7.c Format the swap partition as swap:

			mkswap /dev/sda6


	8. Next, we will mount the formatted partitions to their designated locations. All partitions except the data partition MUST NOT be changed since they are required in this specific manner for the system to work.

		8.a First mount the root partition to /mnt:
		
			mount /dev/sda2 /mnt
		
		8.b Next, set current directory to /mnt and create 4 directories: boot, home, var, data:
		
			cd /mnt
			mkdir boot var home data
		
		8.c Now mount all the partitions (except swap) to their respective directories:
		
			mount /dev/sda1 /mnt/boot
			mount /dev/sda3 /mnt/var
			mount /dev/sda4 /mnt/home
			mount /dev/sda5 /mnt/data
		
		8.d Finally, mount the swap partition:

			swapon /dev/sda6
	
	9. Now, we install the base system along with the development (programming related softwares) packages. So use the following command to do the same (This will take a while depending on Internet):

		pacstrap /mnt base base-devel python3 python2
	

	10. Now, we will set the partition and mount info to be loaded when system starts. This will be done using fstab. So, enter this command:

		genfstab -U /mnt >> /mnt/etc/fstab
	

	11. Now, we will switch our shell to the newly installed system. Hence, enter the following command:

		arch-chroot /mnt
	
	
	12. Now we will setup our time zone to match our real life area. For me, the timezone will be the Indian Standard Time - Kolkata. The timezones are divided by continents with all the timezones for each continent existing in the directory with the name of continent. We will setup a symbolic link to our timezone to /etc/localtime. The command to do so is:

		ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
	

	13. Now we will generate /etc/adjtime. This will set the hardware clock date and time. We do this using the following command:

		hwclock --systohc
	

	14. Now we will setup our language locale. For me this will be en_US.UTF-8.

		14.a Open the /etc/locales.gen file using nano:
		
			nano /etc/locale.gen

		14.b Find the locale of choice by scrolling through the text. Uncomment the locale by removing the '#' symbol preceding it.

		14.c Save the file by pressing Ctrl+x, then entering y to save, and then pressing enter.
		
		14.d Now generate the locale cache for your locale using the command:

			locale-gen

		14.e Now to set the locale.conf with our language, we enter the command:

 			echo "LANG=en_US.UTF-8" > /etc/locale.conf

			The language locale you enter is based on your choice of the locale.

	
	15. Now we will setup the hostname for our system. For me, this will be Electrux-MSI. You can set the hostname according to your liking.

		15.a Enter the hostname in the /etc/hostname file:

			echo "Electrux-MBP" > /etc/hostname

		15.b Open the file /etc/hosts:

			nano /etc/hosts

		15.c Enter a new line below the line:

			::1	localhost.localdomain	localhost

		15.d Enter the following in the new line:

			127.0.1.1 Electrux-MBP.localdomain Electrux-MBP

		15.e Save and close the file using Ctrl+x, y, enter.
	
	16. We also have to enable a couple of modules for MacBooks.
	
		16.a Open /etc/modules in nano as:
		
			nano /etc/modules

		16.b Insert the following two lines:

			coretemp
			applesmc

		16.c Save and close the file using Ctrl+x, y, enter.
	
	17. Now we will remove a preinstalled software for network handling and install a better one:

		17.a Remove netctl package using the following command:

			pacman -R netctl

		17.b Install the packages - networkmanager, bluez, dialog:

			pacman -S networkmanager bluez dialog

		17.c Enable the network manager service to start at boot:

			systemctl enable NetworkManager
	

	18 Now we will setup some final things before rebooting in our new OS:

		18.a Set the password for the root user. This password will govern everything on the computer so set it carefully, using the following command:

			passwd

		18.b It will prompt you to enter new UNIX password. Enter the new password and enter it again to confirm:
		
			Enter new UNIX password: <password>
			Enter again to confirm: <password>

		18.c Install some other important packages like the amazing z shell. Enter the command:

			pacman -S intel-ucode zsh

		18.d Now create your account using the following command:

			useradd -m -G wheel -s /bin/zsh -c "<full name>" <username>

		18.e Set the password for the new account:

			passwd <username>

		18.f Now install and enable the command "sudo" to be used by all the users in group "wheel":

		     	18.f.a Install the sudo package using the following command:

			        pacman -S sudo

			18.f.b Edit the file /etc/sudoers using nano:
			
				nano /etc/sudoers

			18.f.c Scroll down and remove the comment (#) from the line:

				# %wheel ALL=(ALL) ALL

			18.f.d Save and close the file.

		18.g Setup the pacman.conf file to enable yaourt repository and install yaourt:

			18.g.a Edit /etc/pacman.conf file using nano:

				nano /etc/pacman.conf

			18.g.b Scroll through the file and find the line:

				#[multilib]
				#Include = /etc/pacman.d/mirrorlist

			18.g.c Remove the comment (#) from both the lines. This will enable multilib repository for 32 bit libraries.

			18.g.b Scroll to the end of the file, and in a new line, enter the following:

				[archlinuxfr]
				SigLevel = Never
				Server = http://repo.archlinux.fr/$arch

			18.g.c Save and close the file.

			18.g.d Update pacman database to enable the multilib and yaourt repository:

				pacman -Syu

			18.g.e Install yaourt package manager to install applications from the Arch User Repository (AUR):

				pacman -S yaourt customizepkg rsync
	

	19. Now we will install the systemd bootloader to enable the system to boot into our new install:

		19.a Install systemd-boot using the following command:

			bootctl install

		19.b It will install some files in /boot directory. Now we will setup the boot config:

			19.b.a Go to /boot/loader directory:

				cd /boot/loader

			19.b.b Edit the file loader.conf:

				nano loader.conf

			19.b.c Edit the line default <...> and set it as follows:

				default arch

			19.b.d Add new line with the following content:

				editor 0

			19.b.e Save the file and close it.

			19.b.f Go to the entries directory:

				cd entries

			19.b.g Create a new file named arch.conf using nano (since we used arch as the parameter for default entry in loader.conf:

				nano arch.conf

			19.b.h Enter the following in the file:

				Template:

					title		<Title which should be shown at boot>
					linux		/vmlinuz-linux
					initrd		/intel-ucode.img
					initrd		/initramfs-linux.img
					options		root=PARTLABEL=root resume=/dev/sda6 rw


				For me, this is:
				
					title           Electrux Arch Linux
                                        linux           /vmlinuz-linux
                                        initrd          /intel-ucode.img
                                        initrd          /initramfs-linux.img
                                        options         root=PARTLABEL=root resume=/dev/sda6 rw

			19.b.i Save and close the file.

		19.c Now edit the mkinpitcpio.conf file:

			nano /etc/mkinitcpio.conf

		19.d Go to the line with:

			HOOKS="base udev autodetect modconf block..."

		19.e Enter resume just after udev so that the line reads:

			HOOKS="base udev resume autodetect modconf block..."

		19.f Save and close file.

		18.g Regenerate the boot image file for the system using the following command:

			mkinitcpio -p linux
	

	20. Finally exit the chroot environment as follows:

		exit
	
	21. Reboot the system:

		reboot
	

	22. Remove the USB before the system starts. And you will be greeted by a prompt asking you for username and password.
	

# That's it for the Base System Part 1 install. Now move on to the Base Install Part 2.

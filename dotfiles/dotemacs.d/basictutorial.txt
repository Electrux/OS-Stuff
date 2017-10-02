# Electrux

Well, now that I have installed Emacs, some commands must be run to get it setup alongside the init file.
2 Packages must be installed for it to work correctly... Hence, I have made a pure default and my own customized
init file. Core default must be used first and then use the stuff ( the Custom Settings part ) from my own init file.
Default will give a starting point and enable MELPA packages to be installed. Hence custom themes and packages
will be installed through it. If I use my own file, things will get corrupted...
Anyways, just follow these steps after you get the default init file in ~/.emacs.d directory:

1. Follow the following command sequences:

	M-x RET list-packages RET

2. A list of packages will pop up...

	Select tangotango-theme and exec-path-from-shell by going to their
	lines and pressing i to select them. Finalize the selection by pressing x
	and reply yes to the prompt asking if you are sure to install them.

3. With these packages installed,

	Copy the portion of init.el file FROM

	     ;; Custom Settings

	till the end.
	Well, that is all! You are done!


NOW GET BACK TO WORK!!!!

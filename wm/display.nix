{ config, pkgs, ... }: {

	# ENABLING GRAPHICS #
	hardware.graphics.enable = true;
	hardware.graphics.enable32Bit = true; #For 32Bit Games
	
	# PICOM COMPOSITOR + OPACITY #
	services.picom = {
		enable = true;
		backend = "glx"; # uses OPENGL acceleration, non cpu based #
				 #backend = "xrender"; # slow cpu based
		vSync = true;
			
		activeOpacity = 1.0;
		inactiveOpacity = 1.0;
		menuOpacity = 1.0;
		opacityRules = [
			"85:class_g = 'kitty'"
		];

	};
	
	# XSERVER #
	services.xserver = {
		# CORE #
		enable = true;
		autorun = true;
		
		# MONITOR #
		resolutions = [ { x = 1920; y = 1080; } ];			
	
		# DISPLAY MANAGER #
		displayManager = {
			lightdm = {
				enable = true;
				background = /etc/nixos/notnix/media/mtn.jpg;
			};
		};
		
		# WINDOW MANAGER #
		windowManager = {
			i3.enable = true;
		};

		# DISABLING DEFAULTS #
		excludePackages = with pkgs; [
			xterm
			#xorg.xprop 	#terminal command to show window properties
			xorg.xsetroot	#sets bg of root window
			xorg.iceauth 	#needed for kde applications
			xorg.xrefresh   #only for virtualbox
			xorg.xlsclients #lists x clients
			xorg.xset 	#xorg settings
		];

		# KEYBOARD #
		xkb.layout = "us";
		xkb.variant = "";

	}; # END OF XSERVER # 

#----------------------------------------------#		
}

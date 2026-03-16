{ config, pkgs, ... }: {

	imports = [ 
		
		./pc
		./sec
		./sys
		
		./wm
	
		./nixpkgs
		./mypkgs

	];		


	environment.systemPackages = with pkgs; [

		zip
		unzip
		curl
		git
		htop
		kitty
		neofetch
		
		python3 		# NEEDED FOR PROTON ALSO JUST GOOD TO HAVE #

		feh 			# feh --bg-scale /path/to/wallpaper.jpg
		rofi	
		
		maim 			#terminal screenshot utility
		slop			#region selector for main

		librewolf
		vlc
		
		legcord			#lightweight alternative discord client
		spotify
	];

#---------------------------------------------------------#
	system.stateVersion = "25.11"; 
}

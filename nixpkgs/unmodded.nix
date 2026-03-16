{ pkgs, ... }: {

	environment.systemPackages = with pkgs; [

		zip
		unzip
		curl
		git
		htop
		kitty

		python3 # for proton

		feh # feh --bg-scale /path/to/wallpaper.jpg
		rofi # app launcher

		librewolf # browser
		vlc # video player

		#maim # terminal screenshot utility #
		#slop # region selector for maim #

		legcord # lightweight discord client #
		spotify 
	];
}

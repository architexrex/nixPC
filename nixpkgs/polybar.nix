{ config, pkgs, ... }: 

	let
		myPolybar = pkgs.polybar.override {
			
			i3Support = true;
			alsaSupport = true;
			
			nlSupport = false; # FOR ETHERNET/WIFI MODULES#

			githubSupport = false;
			mpdSupport = false;
			pulseSupport = config.pulseadio or false;
			iwSupport = false;

		};
	in {

		environment.systemPackages = with pkgs; [
			myPolybar
		];
	}

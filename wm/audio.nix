
{ config, pkgs, ... }: {
	
	# ENSURE DEVICE FIRMWARE WORKS, ONLY ENABLE IF NEEDED# 
	#hardware.enableAllFirmware = true;

	# RTKIT DAEMON,PULSE/PIPEWIRE USE THIS FOR SCHEDULING PRIORITY #
	security.rtkit.enable = true;

	services = {
		# PIPEWIRE WITH ALSA #
		pipewire ={
			enable = true;
			# ALSA IS USED TO TALK TO AUDIO HARDWARE #
			alsa.enable = true;
			alsa.support32Bit = true; # FOR 32 BIT GAMES #
			
			# WP IS ENABLED BY DEF WHEN PW IS ENABLED # 
			wireplumber.enable = true; 
			
			# OTHER DEFAULTS #
			systemWide = false;
			pulse.enable = false; # PULSE AUDIO EMULATION #
			jack.enable = false; # JACK AUDIO EMULATION #
		};
		
		# BLOAT #
		pulseaudio = {
			enable = false;
		};
	};		
}	

{ config, ... }: {
	
	# THIS DEFAULTS TO WHATEVER XSERVER IS SET TO #
	#services.libinput.enable = true;

	# PC MOUSE SETTINGS #
	services.libinput.mouse = {
		# DISABLING ACCELERATION #
		accelProfile = "flat";
		accelSpeed = "0"; 
		accelStepScroll = null;
		accelStepMotion = null;
		accelStepFallback = null;
		accelPointsScroll = null;
		accelPointsMotion = null;
		accelPointsFallback = null;
		
		# DISABLES L+R = MIDDLE CLICK #
		middleEmulation = false;

		# TAP TO CLICK BEHAVIOR #
		tapping = true;
		
		# LOCKS DRAG WHILE TAPPING #
		tappingDragLock = true;
		
		# SENDS INPUTS TO SYSTEM #
		sendEventsMode = "enabled"; #disabled #disabled-on-external-mouse
		
		horizontalScrolling = true;

		# MOUSE PATH, NULL AUTODETECTS #
		dev = null; # /dev/input/event0 #
		
		calibrationMatrix = null;
		buttonMapping = null;
		clickMethod = null;
		disableWhileTyping = false;
		leftHanded = false;
		transformationMatrix = null;
		tappingButtonMap = null;
		scrollButton = null;
	};
	
	# HYBRID SETTINGS #
	services.libinput.mouse.scrollMethod = "none"; #edge #button #twofinger
	services.libinput.mouse.naturalScrolling = false; #matches windows behav

	# LAPTOP TOUCHPAD #
	#services.libinput.touchpad = {
	#
	#}
}

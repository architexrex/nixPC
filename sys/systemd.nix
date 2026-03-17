{ config, ... }: {
#----------------------------------------------#

# LOG LIMITS #
services.journald.extraConfig = ''
  SystemMaxUse=1G
  RuntimeMaxUse=200M
  MaxRetentionSec=1month
'';

systemd = {
	
	# https://man7.org/linux/man-pages/man5/systemd-system.conf.5.html #
	settings.Manager =  {
		# BOOT STATUS #
		ShowStatus = true; 		
		StatusUnitFormat = "combined"; 	# SHOWS NAME AND SERVICE #
	
		# LOGGING #
		LogColor = true;		# COLORIZED LOGS
		LogLevel = "info"; #debug,console:info #debug
		LogTime = true;
		LogLocation = false; 		# NO FILE-LINE LOG NOISE 
		LogTarget = "journal";		# LOG TO JOURNAL

		# TASK TRACKING #
		DefaultMemoryAccounting = true; # MEMORY
		DefaultTasksAccounting = true;	# PROCESS COUNT
		DefaultIOAccounting = false; # DISK 
		DefaultIPAccounting = false; # NET 

		# size of mem snapshots on crashes #	
		DefaultLimitCORE = "0"; #"infinity"; <- default
		CtrlAltDelBurstAction = "none";
		#-----------------------------------------------#
		# 	FOR SERVERS ONLY  			#
		#-----------------------------------------------#
		RuntimeWatchdogSec = "off";
		RebootWatchdogSec = "off";
		KExecWatchdogSec = "off";
		RuntimeWatchdogPreSec = "0";              # No pre-timeout
   		RuntimeWatchdogPreGovernor = "";          # Leave unset
    		#WatchdogDevice = "/dev/watchdog0";        # Default device
		#-----------------------------------------------#
		}; # END OF SETTINGS.MANAGER
	}; # END OF SYSTEMD
#----------------------------------------------#
}


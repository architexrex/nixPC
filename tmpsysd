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
		#-----------------------------------------------#
		# 	SECURITY				#
		#-----------------------------------------------#
		#CapabilityBoundingSet = [
		#	"~CAP_SYS_MODULE"      # Load/unload kernel modules #
		#	"~CAP_SYS_RAWIO"       # Direct I/O, can corrupt devices #
		#	"~CAP_MAC_ADMIN"       # Change MAC/SELinux/SMACK policies #
		#	"~CAP_MAC_OVERRIDE"    # Bypass MAC/SELinux/SMACK #
		#	#SERVERS / SYSTEM ACCOUNTING TOOLS
		#	"~CAP_SYS_PACCT"        # Configure process accounting
		#	"~CAP_SYS_TTY_CONFIG"  # Reconfigure TTY devices #
			#"~CAP_CHECKPOINT_RESTORE" # Restore checkpointed processes
		#	"~CAP_NET_BROADCAST" # Make network broadcasts rarely need
	
		#];
		CapabilityBoundingSet = "~CAP_MAC_ADMIN ~CAP_MAC_OVERRIDE";

		#dropCaps = [
	# MOST DANGEROUS / ROOT EQUIVELENT #
		#"CAP_SYS_ADMIN"       # Full root access #
		#"CAP_AUDIT_CONTROL"   # Change audit system settings #
	# Dangerous / file system & ownership
		#"CAP_FSETID"           # Set setuid/setgid bits
		#"CAP_LINUX_IMMUTABLE"  # Change immutable / append-only flags
	# DANGER - PROCESS CONTROL & SCHEDULING
		#"CAP_SETPCAP"          # Modify process capabilities
		#"CAP_SYS_PTRACE"       # Trace any process
		#"CAP_SYS_RESOURCE"     # Override resource limits (rlimits)
	# DANGER - NETWORKING #
		#"CAP_NET_RAW"          # Raw sockets, packet sniffing
		#"CAP_NET_ADMIN"        # Network config routes, firewall
		#"CAP_SYSLOG"           # Modify kernel logs

		# OTHER #
		# USED BY LAPTOP POWER MANAGERS / SCHEDULED JOBS
		#"CAP_WAKE_ALARM"       # Trigger system wake from suspend
		# CONTAINERS / ADVANCED VIRTUALIZATION / PROCESS MIGRATION
	
		
		#];
		#enableCaps = [
		# TESTING FOR FIX #
		#"CAP_CHOWN"            # Change file ownership
		#"CAP_SYS_CHROOT"    # Use chroot()
		#"CAP_FOWNER"        # Override file owner restrictions (chmod/chown)
		# HOTPLUG GPU INITIALIZATION #
		#"CAP_MKNOD"            # Create special device files

		#"CAP_SYS_TIME"        # Change system clock/time #

		#"CAP_KILL"             # Send signals to any process
		#"CAP_SYS_BOOT"        # Reboot system / kexec #
		
		#"CAP_DAC_OVERRIDE"     # Bypass all file permissions
		#"CAP_DAC_READ_SEARCH"  # Bypass read/search restrictions
		#"CAP_SETGID"           # Change GID of processes
		#"CAP_SETUID"           # Change UID of processes


		# SAFE OPTIONS #
		#"CAP_NET_BIND_SERVICE" # Bind to privileged ports (<1024)
		#"CAP_BPF"              # Use BPF syscalls (tracing, sandbox)
		#"CAP_PERFMON"          # Access performance counters
		
		#"CAP_SETFCAP"          # Set file capabilities (for specific files)
		#"CAP_AUDIT_WRITE"      # Write audit logs
		#"CAP_AUDIT_READ"       # Read audit logs
		#"CAP_SYS_NICE"         # Raise scheduling priority (rtprio, nice)
		#"CAP_IPC_LOCK"         # Lock memory (mlock)
		#"CAP_IPC_OWNER"        # Override IPC ownership
		#"CAP_BLOCK_SUSPEND"    # Block system suspend

		#];
		
		# PREVENTS PROCESSES FROM GAINING NEW PRIVLEGES #
		# CAN BREAK NORMAL SYSTEM BEHAVIOR #
		NoNewPrivileges = false;	
		# SOME GAMES NEED SETUID LIKE SUDO OR HELPER BINARIES #
		DefaultRestrictSUIDSGID = false;

		# TRUE AUTO OR FALSE, MAKES DIRS READ ONLY
		# AUTO = LEAVES RW WHERE NECESSARY AND READ ONLY /USR
		ProtectSystem = "auto";

		# x86 allows 32-bit games
		#SystemCallArchitectures = "x86 x86-64";#"native";

		# SIMPLIFIED MANDATORY ACCESS CONTROL KERNEL #
		# "/" JUST MEANS DONT APPLY ANY SPECIAL SMACK LABELS
		#DefaultSmackProcessLabel = "/";

		#-----------------------------------------------#
		# 	RESOURCE LIMITS				#
		#-----------------------------------------------#
		# MAX NUMBER OF PROCESSES A SERVICE CAN SPAWN #
		# ~ HALF THE DEFAULT, PREVENTS FORK BOMBS #
		DefaultLimitNPROC = "8192";	
		# LIMIT OPEN FILES #
		# PREVENTS FILE DESCRIPTOR EXHAUSTION ATTACKS #
		DefaultLimitNOFILE = "65536"; 	#** default is 1024:524288

		# LIMIT HOW MUCH RAM PROCESSES CAN LOCK USING MLOCK() #
		# PREVENTS HUGE RAM LOCKS, AND DOS VIA UNSWAPPED MEM #
		DefaultLimitMEMLOCK = "64M";	#* default is 8M,
		
		# MAX Q'D SIGNALS #
		# PREVENTS SIGNAL FLOODING, NORMAL APPS USE A FEW HUNDRED #
		DefaultLimitSIGPENDING = "8192"; #16384 DEFAULT
		
		# MAXIMUM REAL TIME SCHEDULING PRORITY #
		# PREVENTS EXTREME RT PRIORITY #
		DefaultLimitRTPRIO = "30";	  # DEFAULT ~95 MAX 99
		
		#MAX NUMBER OF FILE LOCKS
		DefaultLimitLOCKS = "8192"; #"infinity"; # default


		# can try 16M for msg q
		DefaultLimitMSGQUEUE = "819200";  #* max bytes allowed in POSIX msg
		# can try 2s
		DefaultLimitRTTIME = "infinity";  # max cpu time for real time tasks

		# OOM behavior
		DefaultOOMPolicy = "kill"; #or "continue" keeps sys running when service dies
		DefaultOOMScoreAdjust = "-100";   # -1000 to +1000, 0 is neutral
		#-----------------------------------------------#
		# 	TIMEOUTS & RATE LIMITS			#
		#-----------------------------------------------#
		DefaultTimeoutStartSec = "90s";     # Max time to start services
		DefaultTimeoutStopSec = "90s";      # Max time to stop services
		DefaultTimeoutAbortSec = "90s";     # Max time to abort start/stop
		DefaultRestartSec = "1s";           # Wait before restarting failed units
		DefaultDeviceTimeoutSec = "90s";    # Timeout for device detection (mounts)
		DefaultStartLimitIntervalSec = "10s"; # Rate-limit window for starts
		DefaultStartLimitBurst = "5";       # Max starts per window
		ReloadLimitIntervalSec = "10s";     # Rate-limit daemon reloads
		ReloadLimitBurst = "3";             # Max reloads per window	
		#-----------------------------------------------#
		# 	LOGS & CRASHING				#
		#-----------------------------------------------#
		# BOOT STATUS #
		ShowStatus = true; 		
		StatusUnitFormat = "combined"; 	# SHOWS NAME AND SERVICE #
	
		# LOGGING #
		LogColor = false;		# COLORIZED LOGS
		LogLevel = "info"; #debug,console:info #debug
		LogTime = true;
		LogLocation = false; 		# NO FILE-LINE LOG NOISE 
		LogTarget = "journal";		# LOG TO JOURNAL

		# CRASH DIAGNOSTICS #
		DumpCore = true;		
		CrashAction = "freeze";		# FREEZE ON CRASH FOR DEBUGGING #
		CrashShell = false; 		# OPEN TTY ON CRASH #

		# JOURNALING #
		DefaultStandardOutput = "journal"; # CENTRALIZED LOGGING #
		DefaultStandardError = "inherit";  # KEEPS ERRORS SANE #
		
		# TIMERS #
		DefaultTimerAccuracySec = "1min"; # 30s-1min, 1m for power savings # 
		TimerSlackNSec = "120s"; 	  # 120 seconds, default is 60

		# TASK TRACKING #
		DefaultMemoryAccounting = true; # MEMORY
		DefaultTasksAccounting = true;	# PROCESS COUNT
		DefaultIOAccounting = false; # DISK 
		DefaultIPAccounting = false; # NET 

		DefaultTasksMax = "15%"; #~4915 MAX THREADS A PROCESS CAN CREATE#

		#-----------------------------------------------#
		# 	BEST NOT TO TOUCH THESE, GOOD DEFAULTS  #
		#-----------------------------------------------#
		# size of mem snapshots on crashes #	
		DefaultLimitCORE = "0"; #"infinity"; <- default

		# LEAVE NUMA DEFAULT UNLESS NUMA SERVER,HPC WORKLOAD,MULTI-SOCK CPU
		NUMAPolicy = "default";
		NUMAMask = "";
			# Memory pressure monitoring
		DefaultMemoryPressureWatch = "auto"; # monitors mem pressure psi
		DefaultMemoryPressureThresholdSec = "200ms"; # mem warning
	
		DefaultLimitNICE = "0";	# prevents services from icnrease sched prio	 
		DefaultLimitSTACK = "8M";    	# linux default, stack size per thread
		DefaultLimitCPU = "infinity";   # max cpu time a process can consume
		DefaultLimitRSS = "infinity";	# resident memory limit
		DefaultLimitFSIZE = "infinity"; # max file size a proc. can create
		DefaultLimitAS = "infinity";	# max virtual mem size
		DefaultLimitDATA = "infinity";  # max data seg (heap memory)
		
		CPUAffinity = "";  # leave unrestricted unless doing CPU isolation
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


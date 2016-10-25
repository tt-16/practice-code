#!/bin/bash

#0 is ready
#export MutexClock_input=0
#export MutexClock_wps=0
#export MutexClock_ARWPost=0
#export MutexClock_gs=0

while 
	
if	MutexClock_wps==0
	MutexClock_wps=1
	nohup ./optLock/unLock_wps.sh &
	#sleep 5	
	#MutexClock_wps=0
	break;

endif

endwhile



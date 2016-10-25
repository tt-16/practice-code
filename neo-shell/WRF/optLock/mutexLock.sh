#!/bin/bash
#0 is ready

source /wrf/LIBRARIES/shell/optLock/MLockInc.sh
logfile="/wrf/LOG/lock.log"

echo $1
LineNum="$1"
currWindFram="$2"

while [ true ] 	
do
	lockStatus=`awk -F '=' 'NR=='$LineNum' {print $2}' $lockStatusFile`
	echo $lockStatus
	echo "# $currWindFram is wating ...$lockStatus" >> $logfile
	
	if [ $lockStatus == "0" ]
	then
		sed -i $LineNum' s/0/1/g' $lockStatusFile
		date=`date +%Y-%m-%d-%H:%M:%S`
		echo "# $currWindFram get the $LineNum  lock at $date"	>> $logfile
		nohup /wrf/LIBRARIES/shell/optLock/unLock_wps.sh $LineNum &
		echo "----------------" >> $logfile
		break;
	fi
done



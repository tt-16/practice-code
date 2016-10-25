#!/bin/bash
logfile="/wrf/LOG/loop.log"
shelldir="/wrf/run_GFS/shell"
TaskCfgFile="$shelldir/task_1.cfg"
CPNum="$1"
dataType="$2"
declare -a windFarmArray

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "	" >> $logfile
echo "< loop Start at  " $date ">" >> $logfile

#============get cent point array============
CENTPOINTS=`awk -F":" '$1=="'$CPNum'" {print}' $TaskCfgFile`
ARRSIZE=`awk -F":" '$1=="'$CPNum'" {print NF}' $TaskCfgFile`

echo "CENTPOINT="$CENTPOINTS "ARRSIZE="$ARRSIZE "TaskCfgFile="$TaskCfgFile "CPNum="$CPNum >> /wrf/LOG/debugFile.log


arr=(${CENTPOINTS//:/ })

i=2
while [ $i -le $ARRSIZE ]
do
	echo "CP:NAME IS ${arr[$i-1]}" >> $logfile
	windFarmArray[$i-2]=${arr[$i-1]}
	let i=$i+1
done

#==============loop action==================


for item in ${windFarmArray[*]}
do
	#echo "$item : ${windFarmArray[*]}" >> /wrf/LOG/debugFile.log
	export Wname=$item
	date=`date +%Y-%m-%d_%H:%M:%S`
	echo "in loop "$Wname "Start at  " $date ">" >> $logfile
	#echo "$Wname" >> /wrf/LOG/debugFile.log
	
	
		#/wrf/LIBRARIES/shell/setConfig.sh 
	    echo "Running ECMWF Numerical Weather Report of $Wname ..."
		/wrf/run_GFS/shell/wrf.sh $dataType
		sleep 30
		#/wrf/LIBRARIES/shell/sendMail.sh
	
	date=`date +%Y-%m-%d_%H:%M:%S`
	echo "$dataType "$Wname "end at  " $date ">" >> $logfile
done


date=`date +%Y-%m-%d_%H:%M:%S`
echo "< loop end at  " $date ">" >> $logfile
echo " " >> $logfile


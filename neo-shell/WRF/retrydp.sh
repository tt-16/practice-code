#!/bin/bash
shelldir="/wrf/run_GFS/shell"
TaskCfgFile="$shelldir/task_1.cfg"

i=`awk -F "=" '$1=="taskNum" {print $2}' $TaskCfgFile | awk -F"-" '{print $1}'`
TASKMAX=`awk -F "=" '$1=="taskNum" {print $2}' $TaskCfgFile | awk -F"-" '{print $2}'`


while [ $i -le $TASKMAX ]
do
		echo "task $i is running"
		nohup $shelldir/loop.sh $i &
		sleep 60
		let i=$i+1
done


CPNum="$1"
declare -a windFarmArray

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "	" >> $logfile
echo "< loop Start at  " $date ">" >> $logfile

#============get cent point array============
CENTPOINTS=`awk -F":" '$1=="'$CPNum'" {print}' $TaskCfgFile`
ARRSIZE=`awk -F":" '$1=="'$CPNum'" {print NF}' $TaskCfgFile`

echo "CENTPOINT="$CENTPOINTS "ARRSIZE="$ARRSIZE "TaskCfgFile="$TaskCfgFile "CPNum="$CPNum >> $logfile

arr=(${CENTPOINTS//:/ })

i=2
while [ $i -le $ARRSIZE ]
do
	echo "CP:NAME IS ${arr[$i-1]}" >> $logfile
	windFarmArray[$i-2]=${arr[$i-1]}
	let i=$i+1
done

#==============loop action==================
j=0
for item in ${windFarmArray[*]}
do
	#echo ${windFarmArray[j]}
	export Wname=${windFarmArray[j]}
	date=`date +%Y-%m-%d_%H:%M:%S`
	echo "in loop "$Wname "Start at  " $date ">" >> $logfile
	
		#/wrf/LIBRARIES/shell/setConfig.sh 
	    echo "Running ECMWF Numerical Weather Report of $Wname ..."
		/wrf/run_GFS/shell/wrf.sh
		sleep 10
		#/wrf/LIBRARIES/shell/sendMail.sh
	
	date=`date +%Y-%m-%d_%H:%M:%S`
	echo "	"$Wname "end at  " $date ">" >> $logfile
	j+=1
done


date=`date +%Y-%m-%d_%H:%M:%S`
echo "< loop end at  " $date ">" >> $logfile
echo " " >> $logfile


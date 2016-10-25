#!/bin/bash

if [ $# -eq 1 ]
then
dataType="$1"
else
dataType="0000"
fi


if [ $dataType == "0000" ]
then
filedate="12"
elif [ $dataType == "0600" ]
then
filedate="18"
elif [ $dataType == "1200" ]
then
filedate="00"
elif [ $dataType == "1800" ]
then
filedate="06"
fi

#dataType=$1
shelldir="/wrf/run_GFS/shell"
TaskCfgFile="$shelldir/task_1.cfg"
#DBF="DEBUG"
i=`awk -F "=" '$1=="taskNum" {print $2}' $TaskCfgFile | awk -F"-" '{print $1}'`
TASKMAX=`awk -F "=" '$1=="taskNum" {print $2}' $TaskCfgFile | awk -F"-" '{print $2}'`

#export PATH=/wrf/LIBRARIES/supplib/bin:$PATH
#source /etc/profile

if [ "$DBF" != "DEBUG" ]
then
$shelldir/ungrib.sh $dataType
fi

while [ $i -le $TASKMAX ]
do
		#echo "$i-$TASKMAX" >> /wrf/LOG/debugFile.log
		echo "task $i is running $dataType"
		nohup $shelldir/loop.sh $i $dataType &
		sleep 1
		let i=$i+1
done



#!/bin/bash

if [ $# -eq 1 ]
then
dataType="$1"
else
dataType="1200"
fi

#DBF="DEBUG"

echo "argument dataType is $dataType"

logfile="/wrf/LOG/gfs_run.log"
date=`date +%Y-%m-%d_%H:%M:%S`
shelldir="/wrf/run_GFS/shell"

export PATH=/wrf/LIBRARIES/supplib/bin:$PATH
source /etc/profile

echo "	" > $logfile
echo "< running shell start at " $date ">" >> $logfile
echo "	" >> $logfile

if [ "$DBF" != "DEBUG" ]
then
date=`date +%Y%m%d`
mkdir /wrf/DATA/$date
echo "	mkdir /wrf/DATA/"$date >> $logfile
echo "	" >> $logfile

cp $shelldir/downloadData.sh /wrf/DATA/$date/downloadData.sh
echo "	cp $shelldir/downloadData.sh /wrf/DATA/"$date"/downloadData.sh" >> $logfile
echo "	" >> $logfile

cd /wrf/DATA/$date
echo "	cd /wrf/DATA/"$date >> $logfile
echo "	" >> $logfile

./downloadData.sh $dataType
echo "	./downloadData.sh" >> $logfile
echo "	" >> $logfile
fi


$shelldir/task.sh $dataType
echo "	$shelldir/task.sh $dataType" >> $logfile 
echo "	" >> $logfile 

date=`date +%Y-%m-%d_%H:%M:%S` 
echo "< running shell finished at " $date ">" >> $logfile 
echo "	" >> $logfile

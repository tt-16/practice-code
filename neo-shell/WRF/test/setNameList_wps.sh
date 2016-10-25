#!/bin/bash
#********************************************************
#  [modify the namelist f parameter]
#********************************************************
#Wname="name"

logfile="/wrf/LOG/$Wname/setConfig.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< setConfig shell start at " $date ">" >> $logfile
echo "	" >> $logfile

#-------------
newStartDate=`date +%Y-%m-%d_`'15:00:00'
oldStartDate=`date --date='-24 hour' +%Y-%m-%d_`'15:00:00'

newEndDate=`date --date='+24 hour' +%Y-%m-%d_`'18:00:00'
oldEndDate=`date --date='+48 hour' +%Y-%m-%d_`'18:00:00'
#-------------


#modify /wrf/LIBRARIES/WPS/ 
oldStartDate=`awk '$1=="start_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps`
oldEndDate=`awk '$1=="end_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps`
sed -i "s/$oldStartDate/$newStartDate/g"    	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps  
sed -i "s/$oldEndDate/$newEndDate/g"  			/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps

#replace the namelist file
rm /wrf/LIBRARIES/WPS/namelist.wps -rf
cp -r -f /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps  /wrf/LIBRARIES/WPS/


date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "< setConfig shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



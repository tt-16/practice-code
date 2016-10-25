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

newOutputRootName_date=`date +%Y%m%d`
oldOutputRootName_date=`date --date='-24 hour' +%Y%m%d`
#-------------


#modify /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost
oldStartDate=`awk '$1=="start_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
oldEndDate=`awk '$1=="end_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
oldOutputRootName_date=`awk '$1=="output_root_name"{split( $3, date, "/" ); print date[6]}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
sed -i "s/$oldStartDate/$newStartDate/g"    	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost  
sed -i "s/$oldEndDate/$newEndDate/g"  			/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost
sed -i "s/$oldOutputRootName_date/$newOutputRootName_date/g"     /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost

#replace the namelist file
rm /wrf/LIBRARIES/ARWpost/namelist.ARWpost -rf
cp -r -f /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost  /wrf/LIBRARIES/ARWpost/


date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "< setConfig shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



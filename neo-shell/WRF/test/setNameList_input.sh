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
newStartYear=`date +%Y`                        #= 2015, 2015, 2015,
oldStartYear=`date --date='-24 hour' +%Y`      #= 2015, 2015, 2015,
newStartMonth=`date +%m`                       #= 05,   05,   05,
oldStartMonth=`date --date='-24 hour' +%m`     #= 05,   05,   05,
newStartDay=`date +%d`                         #= 12,   12,   12,
oldStartDay=`date --date='-24 hour' +%d`       #= 12,   12,   12,
#newStartHour                       		   #= 15,   15,   15,
#oldStartHour                       		   #= 15,   15,   15,

#start_minute                       		   = 00,   00,   00,
#start_second                       		   = 00,   00,   00,
 
newEndYear=`date --date='+24 hour' +%Y`        #= 2015, 2015, 2015,
oldEndYear=`date --date='+48 hour' +%Y`        #= 2015, 2015, 2015,
newEndMonth=`date --date='+24 hour' +%m`       #= 05,   05,   05,
oldEndMonth=`date --date='+48 hour' +%m`       #= 05,   05,   05,
newEndDay=`date --date='+24 hour' +%d`         #= 15,   15,   15,
oldEndDay=`date --date='+48 hour' +%d`         #= 15,   15,   15,

#-------------


#modify /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input 
oldStartYear=`awk '$1=="start_year"{print substr($3,1,4)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OSYNR=`awk '$1=="start_year"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
oldStartMonth=`awk '$1=="start_month"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OSMNR=`awk '$1=="start_month"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
oldStartDay=`awk '$1=="start_day"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OSDNR=`awk '$1=="start_day"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
oldEndYear=`awk '$1=="end_year"{print substr($3,1,4)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OEYNR=`awk '$1=="end_year"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
oldEndMonth=`awk '$1=="end_month"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OEMNR=`awk '$1=="end_month"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
oldEndDay=`awk '$1=="end_day"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
OEDNR=`awk '$1=="end_day"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
sed -i "$OSYNR s/$oldStartYear/$newStartYear/g"  	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input  
sed -i "$OSMNR s/$oldStartMonth/$newStartMonth/g"  	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input
sed -i "$OSDNR s/$oldStartDay/$newStartDay/g"  	 	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input
sed -i "$OEYNR s/$oldEndYear/$newEndYear/g"  		/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input   
sed -i "$OEMNR s/$oldEndMonth/$newEndMonth/g"  	 	/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input
sed -i "$OEDNR s/$oldEndDay/$newEndDay/g"  	 		/wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input

#replace the namelist file
rm /wrf/LIBRARIES/WRFV3/test/em_real/namelist.input -rf
cp -r -f /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input  /wrf/LIBRARIES/WRFV3/test/em_real/


date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "< setConfig shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



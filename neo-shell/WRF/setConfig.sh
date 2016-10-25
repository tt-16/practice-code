#!/bin/bash

#********************************************************
#  [modify the namelist f parameter]
#********************************************************
#Wname="name"

logfile="/wrf/LOG/$Wname/ecm_setConfig.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< setConfig shell start at " $date ">" >> $logfile
echo "	" >> $logfile


newStartDate=`date --date='-24 hour' +%Y-%m-%d_`'12:00:00'
newEndDate=`date --date='+24 hour' +%Y-%m-%d_`'18:00:00'
newOutputRootName_date=`date +%Y%m%d`

#------namelist.input-------
newStartYear=`date --date='-24 hour' +%Y`      #= 2015, 2015, 2015,
newStartMonth=`date --date='-24 hour' +%m`     #= 05,   05,   05,
newStartDay=`date --date='-24 hour' +%d`       #= 12,   12,   12,
#newStartHour                       		   #= 15,   15,   15,
#oldStartHour                       		   #= 15,   15,   15,

#start_minute                       		   = 00,   00,   00,
#start_second                       		   = 00,   00,   00,
 
newEndYear=`date --date='+24 hour' +%Y`        #= 2015, 2015, 2015,
newEndMonth=`date --date='+24 hour' +%m`       #= 05,   05,   05,
newEndDay=`date --date='+24 hour' +%d`         #= 15,   15,   15,

#end_hour                            		   #= 18,   18,   18,
#end_minute                          		   = 00,   00,   00,
#end_second                         		   = 00,   00,   00,


#echo "newEndDate is "$newEndDate
#echo "oldEndDate is "$oldEndDate
#echo "newStartDate is "$newStartDate
#echo "oldStartDate is "$oldStartDate
#echo "newOutputRootName_date is "$newOutputRootName_date
#echo "oldOutputRootName_date is "$oldOutputRootName_date
#------namelist.input-------

#nameListWpsPath="/wrf/run_GFS/WindFarmConfig/$Wname/namelist.wps"
#nameListInputPath="/wrf/run_GFS/WindFarmConfig/$Wname/namelist.input"
#nameListARWpostPath="/wrf/run_GFS/WindFarmConfig/$Wname/namelist.ARWpost"
#nameListGsPath="/wrf/run_GFS/WindFarmConfig/$Wname/wg.gs"

nameListWpsPath="/wrf/run_GFS/WindFarmConfig/$Wname/WPS/namelist.wps"
nameListInputPath="/wrf/run_GFS/WindFarmConfig/$Wname/WRFV3/test/em_real/namelist.input"
nameListARWpostPath="/wrf/run_GFS/WindFarmConfig/$Wname/ARWpost/namelist.ARWpost"
nameListGsPath="/wrf/run_GFS/WindFarmConfig/$Wname/grads-2.1.a3/bin/wg.gs"


#/wrf/run_GFS/WPS/ 
oldStartDate=`awk '$1=="start_date"{print substr($3,2,19)}' $nameListWpsPath`
oldEndDate=`awk '$1=="end_date"{print substr($3,2,19)}' $nameListWpsPath`
sed -i "s/$oldStartDate/$newStartDate/g" $nameListWpsPath  
sed -i "s/$oldEndDate/$newEndDate/g" $nameListWpsPath

#/wrf/run_GFS/WRFV3/test/em_real/ 
oldStartYear=`awk '$1=="start_year"{print substr($3,1,4)}' $nameListInputPath`
OSYNR=`awk '$1=="start_year"{print NR}' $nameListInputPath`
oldStartMonth=`awk '$1=="start_month"{print substr($3,1,2)}' $nameListInputPath`
OSMNR=`awk '$1=="start_month"{print NR}' $nameListInputPath`
oldStartDay=`awk '$1=="start_day"{print substr($3,1,2)}' $nameListInputPath`
OSDNR=`awk '$1=="start_day"{print NR}' $nameListInputPath`
oldEndYear=`awk '$1=="end_year"{print substr($3,1,4)}' $nameListInputPath`
OEYNR=`awk '$1=="end_year"{print NR}' $nameListInputPath`
oldEndMonth=`awk '$1=="end_month"{print substr($3,1,2)}' $nameListInputPath`
OEMNR=`awk '$1=="end_month"{print NR}' $nameListInputPath`
oldEndDay=`awk '$1=="end_day"{print substr($3,1,2)}' $nameListInputPath`
OEDNR=`awk '$1=="end_day"{print NR}' $nameListInputPath`
sed -i "$OSYNR s/$oldStartYear/$newStartYear/g" $nameListInputPath 
sed -i "$OSMNR s/$oldStartMonth/$newStartMonth/g" $nameListInputPath
sed -i "$OSDNR s/$oldStartDay/$newStartDay/g" $nameListInputPath
sed -i "$OEYNR s/$oldEndYear/$newEndYear/g"	$nameListInputPath 
sed -i "$OEMNR s/$oldEndMonth/$newEndMonth/g" $nameListInputPath
sed -i "$OEDNR s/$oldEndDay/$newEndDay/g" $nameListInputPath

#/wrf/run_GFS/ARWpost/
oldStartDate=`awk '$1=="start_date"{print substr($3,2,19)}' $nameListARWpostPath`
oldEndDate=`awk '$1=="end_date"{print substr($3,2,19)}' $nameListARWpostPath`
oldOutputRootName_date=`awk '$1=="output_root_name"{split( $3, date, "/" ); print date[6]}' $nameListARWpostPath`
sed -i "s/$oldStartDate/$newStartDate/g"    	$nameListARWpostPath  
sed -i "s/$oldEndDate/$newEndDate/g"  			$nameListARWpostPath
sed -i "s/$oldOutputRootName_date/$newOutputRootName_date/g"     $nameListARWpostPath

#/wrf/run_GFS/grads-2.1.a3/bin/
oldWgGs_date=`awk '$1=="'\''open"{split( $2, date, "/" ); print date[6]}' $nameListGsPath`
sed -i "s/$oldWgGs_date/$newOutputRootName_date/g"     $nameListGsPath  

#replace the namelist file
#rm /wrf/run_GFS/WPS/namelist.wps -rf
#rm /wrf/run_GFS/WRFV3/test/em_real/namelist.input -rf
#rm /wrf/run_GFS/ARWpost/namelist.ARWpost -rf
#rm /wrf/run_GFS/grads-2.1.a3/bin/wg.gs -rf

#cp -r -f /wrf/run_GFS/WindFarmConfig/$Wname/namelist.wps  /wrf/run_GFS/WPS/
#cp -r -f /wrf/run_GFS/WindFarmConfig/$Wname/namelist.input  /wrf/run_GFS/WRFV3/test/em_real/
#cp -r -f /wrf/run_GFS/WindFarmConfig/$Wname/namelist.ARWpost  /wrf/run_GFS/ARWpost/
#cp -r -f /wrf/run_GFS/WindFarmConfig/$Wname/wg.gs  /wrf/run_GFS/grads-2.1.a3/bin/

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "< setConfig shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



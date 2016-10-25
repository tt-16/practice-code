#!/bin/bash 
#********************************************************
#  [修改配置文件脚本]
#  每日03:00自动执行，
#  执行过程记录在日志文件中 logfile="/wrf/LOG/wrf.log"
#********************************************************

logfile="/wrf/LOG/ecm_setTime.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< setTime shell start at " $date ">" >> $logfile
echo "	" >> $logfile


newStartDate=`date --date='-24 hour' +%Y-%m-%d_`'12:00:00'
newEndDate=`date --date='+24 hour' +%Y-%m-%d_`'18:00:00'
oldStartDate=`awk '$1=="start_date"{print substr($3,2,19)}' /wrf/run_GFS/WPS/namelist.wps`
oldEndDate=`awk '$1=="end_date"{print substr($3,2,19)}' /wrf/run_GFS/WPS/namelist.wps`
sed -i "s/$oldStartDate/$newStartDate/g"    	/wrf/run_GFS/WPS/namelist.wps  
sed -i "s/$oldEndDate/$newEndDate/g"  			/wrf/run_GFS/WPS/namelist.wps

date=`date +%Y-%m-%d_%H:%M:%S`
echo "< setTime shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



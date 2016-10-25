#!/bin/bash
dataType=$1
logfile="/wrf/LOG/loop.log"
shelldir="/wrf/run/shell"
TaskCfgFile="$shelldir/task_1.cfg"

#=============rm ECMWF============
rm /wrf/run_GFS/WPS/GFS2:* -r -f
rm /wrf/run_GFS/WPS/PFILE:* -r -f
echo " rm /wrf/run_GFS/WPS/GFS2:* -r -f	" >> $logfile
echo "	" >> $logfile

#=============setTime============
/wrf/run_GFS/shell/setTime.sh
echo " SetTime shell finished	" >> $logfile
echo "	" >> $logfile

#=============ungrib=============
ungribLogfile="/wrf/LOG/ungrib.log"
ln -sf /wrf/run_GFS/WPS/ungrib/Variable_Tables/Vtable.GFS /wrf/run_GFS/WPS/Vtable
echo "	ln -sf /wrf/run_GFS/WPS/ungrib/Variable_Tables/Vtable.GFS /wrf/run_GFS/WPS/Vtable" > $ungribLogfile
echo "	" >> $ungribLogfile

floderDate=`date +%Y%m%d`
cd /wrf/run_GFS/WPS
./link_grib.csh /wrf/DATA/$floderDate/GFS_
echo "	./link_grib.csh /wrf/DATA/$floderDate/GFS_ finished" >> $ungribLogfile
echo "	" >> $ungribLogfile


date=`date +%Y-%m-%d_%H:%M:%S`
echo "	./ungrib.exe [start at:"$date"]" >> $ungribLogfile
echo "	" >> $ungribLogfile
source /etc/profile
mpirun -np 8 /wrf/run_GFS/WPS/ungrib.exe >> $ungribLogfile
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	./ungrib.exe [finished at:"$date"]" >> $ungribLogfile
echo "	" >> $ungribLogfile



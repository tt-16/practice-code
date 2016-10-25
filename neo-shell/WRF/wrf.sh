#!/bin/bash
#********************************************************
#  file="/wrf/LOG/wrf.log"
#********************************************************

#Wname="wangfu"
source /etc/profile
dataType=$1
logfile="/wrf/LOG/$Wname/ecm_wrf.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< wrf shell start at " $date ">" >> $logfile
echo "	" >> $logfile

/wrf/run_GFS/shell/clear.sh 
echo "	/wrf/run_GFS/shell/clear.sh" >> $logfile 
echo "	" >> $logfile

/wrf/run_GFS/shell/setConfig.sh
echo "	/wrf/run_GFS/shell/setConfig.sh" >> $logfile
echo "	" >> $logfile

cd /wrf/run_GFS/WindFarmConfig/$Wname/WPS
echo "	cd /wrf/run_GFS/WindFarmConfig/$Wname/WPS" >> $logfile
echo "	" >> $logfile

ln -sf /wrf/run_GFS/WPS/GFS2:* .
echo "	ln -sf /wrf/run_GFS/WPS/GFS2:* ." >> $logfile
echo "	" >> $logfile
			
date=`date +%Y-%m-%d_%H:%M:%S`
echo "  " >> $logfile
./geogrid.exe  >> $logfile
echo "	./geogrid.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile


Startdate=`date +%Y-%m-%d_%H:%M:%S`
echo "	./metgrid.exe [start at:"$date"]" >> $logfile
#mpirun -np 8 ./metgrid.exe
./metgrid.exe  >> $logfile
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	./metgrid.exe [start at:"$Startdate"] [end at:"$date"]" >> $logfile
echo "	" >> $logfile
					
echo "WRF3 ----------------------"
cd /wrf/run_GFS/WindFarmConfig/$Wname/WRFV3/test/em_real
echo "	cd /wrf/run_GFS/WRFV3/test/em_real" >> $logfile
echo "	" >> $logfile

ln -sf /wrf/run_GFS/WindFarmConfig/$Wname/WPS/met_em* .
echo "	wrf/run_GFS/WindFarmConfig/$Wname/WPS/met_em* ." >> $logfile
echo "	" >> $logfile

date=`date +%Y-%m-%d_%H:%M:%S`
./real.exe  >> $logfile
echo "	./real.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile

Startdate=`date +%Y-%m-%d_%H:%M:%S`
echo "	mpirun -np 1 wrf.exe [start at:"$date"]" >> $logfile
echo "  " >> $logfile

#mpirun -np 8 ./wrf.exe
./wrf.exe  >> $logfile
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	mpirun -np 1 wrf.exe [Start at: "$Startdate"] [end at:"$date"]" >> $logfile
echo "	" >> $logfile

echo "ARWpost ------------------------"
cd /wrf/run_GFS/WindFarmConfig/$Wname/ARWpost
echo "	cd /wrf/run_GFS/WindFarmConfig/$Wname/ARWpost" >> $logfile
echo "	" >> $logfile

floderDate=`date +%Y%m%d`
mkdir /wrf/run_GFS/RESULT/$Wname/$floderDate -p -v
echo "	mkdir /wrf/run_GFS/RESULT/$Wname/$floderDate -p -v " >> $logfile
echo "	" >> $logfile

date=`date +%Y-%m-%d_%H:%M:%S`
./ARWpost.exe  >> $logfile
echo "	./ARWpost.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile


cd /wrf/run_GFS/WindFarmConfig/$Wname/grads-2.1.a3/bin
echo "	cd /wrf/run_GFS/WindFarmConfig/$Wname/grads-2.1.a3/bin" >> $logfile
echo "	" >> $logfile
 
 
date=`date +%Y-%m-%d_%H:%M:%S`
./grads -lbc "run wg.gs"
echo "	./grads -lbc run wg.gs [at:"$date"]" >> $logfile
echo "	" >> $logfile

floderDate=`date +%Y%m%d`
mv out.txt /wrf/run_GFS/RESULT/$Wname/$floderDate/out.txt
echo "	mv out.txt /wrf/run_GFS/RESULT/$Wname/$floderDate/out.txt" >> $logfile
echo "	" >> $logfile

rm /wrf/run_GFS/RESULT/$Wname/$floderDate/dp -rf
cp /wrf/run_GFS/shell/dp /wrf/run_GFS/RESULT/$Wname/$floderDate/dp
echo "	cp /wrf/run_GFS/shell/dp /wrf/run_GFS/RESULT/$Wname/$floderDate/dp" >> $logfile
echo "	" >> $logfile

cd /wrf/run_GFS/RESULT/$Wname/$floderDate/
echo "	/wrf/run_GFS/RESULT/$Wname/$floderDate/" >> $logfile
echo "	" >> $logfile

./dp WRF $dataType 
echo "$Wname ./dp WRF $dataType" >> $logfile
echo "	" >> $logfile

/wrf/run_GFS/shell/autoUploadFtp.sh $dataType >>$logfile
echo "	/wrf/run_GFS/shell/ftp/autoUploadFtp.sh $Wname" >> $logfile
echo "	" >> $logfile

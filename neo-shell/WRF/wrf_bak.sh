#!/bin/bash
#********************************************************
#  file="/wrf/LOG/wrf.log"
#********************************************************

#Wname="wangfu"
source /etc/profile
source /wrf/LIBRARIES/shell/optLock/MLockInc.sh

logfile="/wrf/LOG/$Wname/wrf.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< wrf shell start at " $date ">" >> $logfile
echo "	" >> $logfile

/wrf/LIBRARIES/shell/clear.sh
echo "	/wrf/LIBRARIES/shell/clear.sh" >> $logfile
echo "	" >> $logfile

cd /wrf/LIBRARIES/WPS
echo "	cd /wrf/LIBRARIES/WPS" >> $logfile
echo "	" >> $logfile
			
date=`date +%Y-%m-%d_%H:%M:%S`
#/wrf/LIBRARIES/shell/optLock/mutexLock.sh $nLockWps $Wname
/wrf/LIBRARIES/shell/setNameList_wps.sh 
echo "  /wrf/LIBRARIES/shell/setNamelist_wps.sh" >> $logfile
echo "  " >> $logfile
./geogrid.exe  >> $logfile
echo "	./geogrid.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile


Startdate=`date +%Y-%m-%d_%H:%M:%S`
echo "	./metgrid.exe [start at:"$date"]" >> $logfile
#mpirun -np 8 ./metgrid.exe  >> $logfile
#/wrf/LIBRARIES/shell/optLock/mutexLock.sh $nLockWps $Wname
/wrf/LIBRARIES/shell/setNameList_wps.sh 
echo "  /wrf/LIBRARIES/shell/setNamelist_wps.sh" >> $logfile
echo "  " >> $logfile
./metgrid.exe  >> $logfile
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	./metgrid.exe [start at:"$Startdate"] [end at:"$date"]" >> $logfile
echo "	" >> $logfile
					
echo "WRF3 ----------------------"
cd /wrf/LIBRARIES/WRFV3/test/em_real
echo "	cd /wrf/LIBRARIES/WRFV3/test/em_real" >> $logfile
echo "	" >> $logfile

#ln -sf /wrf/LIBRARIES/WindFarmConfig/$Wname/TempFiles/met_em* .
echo "	ln -sf /wrf/LIBRARIES/WPS/met_em* ." >> $logfile
echo "	" >> $logfile

date=`date +%Y-%m-%d_%H:%M:%S`
#/wrf/LIBRARIES/shell/optLock/mutexLock.sh $nLockInput $Wname
/wrf/LIBRARIES/shell/setNameList_input.sh 
echo "  /wrf/LIBRARIES/shell/setNamelist_input.sh" >> $logfile
echo "  " >> $logfile
./real.exe  >> $logfile
echo "	./real.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile

Startdate=`date +%Y-%m-%d_%H:%M:%S`
echo "	mpirun -np 1 wrf.exe [start at:"$date"]" >> $logfile
echo "  " >> $logfile

./wrf.exe  >> $logfile
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	mpirun -np 1 wrf.exe [Start at: "$Startdate"] [end at:"$date"]" >> $logfile
echo "	" >> $logfile

echo "ARWpost ------------------------"
cd /wrf/LIBRARIES/ARWpost
echo "	cd /wrf/LIBRARIES/ARWpost" >> $logfile
echo "	" >> $logfile

floderDate=`date +%Y%m%d`
mkdir /wrf/LIBRARIES/RESULT/$Wname/$floderDate -p -v
echo "	mkdir /wrf/LIBRARIES/RESULT/$Wname/$floderDate -p -v " >> $logfile
echo "	" >> $logfile

date=`date +%Y-%m-%d_%H:%M:%S`
#/wrf/LIBRARIES/shell/optLock/mutexLock.sh $nLockARWpost $Wname
/wrf/LIBRARIES/shell/setNameList_ARWpost.sh
echo "  /wrf/LIBRARIES/shell/setNamelist_ARWpost.sh" >> $logfile
echo "  " >> $logfile

./ARWpost.exe  >> $logfile
echo "	./ARWpost.exe [at:"$date"]" >> $logfile
echo "	" >> $logfile


cd /wrf/LIBRARIES/grads-2.1.a3/bin
echo "	cd /wrf/LIBRARIES/grads-2.1.a3/bin" >> $logfile
echo "	" >> $logfile
 
 
date=`date +%Y-%m-%d_%H:%M:%S`
#/wrf/LIBRARIES/shell/optLock/mutexLock.sh $nLockGs $Wname
/wrf/LIBRARIES/shell/setWg_gs.sh 
echo "  /wrf/LIBRARIES/shell/setWg_gs.sh" >> $logfile
echo "  " >> $logfile

./grads -lbc "run wg.gs"
echo "	./grads -lbc run wg.gs [at:"$date"]" >> $logfile
echo "	" >> $logfile

floderDate=`date +%Y%m%d`
mv out.txt /wrf/LIBRARIES/RESULT/$Wname/$floderDate/out.txt
echo "	mv out.txt /wrf/LIBRARIES/RESULT/$Wname/$floderDate/out.txt" >> $logfile
echo "	" >> $logfile


cp /wrf/LIBRARIES/shell/dp /wrf/LIBRARIES/RESULT/$Wname/$floderDate/dp
echo "	cp /wrf/LIBRARIES/shell/dp /wrf/LIBRARIES/RESULT/$Wname/$floderDate/dp" >> $logfile
echo "	" >> $logfile

cd /wrf/LIBRARIES/RESULT/$Wname/$floderDate/
echo "	/wrf/LIBRARIES/RESULT/$Wname/$floderDate/" >> $logfile
echo "	" >> $logfile

./dp $Wname 
echo "	./dp $Wname" >> $logfile
echo "	" >> $logfile

/wrf/LIBRARIES/shell/autoUploadFtp.sh >>$logfile
echo "	/wrf/LIBRARIES/shell/ftp/autoUploadFtp.sh $Wname" >> $logfile
echo "	" >> $logfile

/wrf/LIBRARIES/shell/sendMail.sh

date=`date +%Y-%m-%d_%H:%M:%S`
echo "< wrf shell finished at " $date ">" >> $logfile
echo "	" >> $logfile




#!/bin/bash

#********************************************************
#  [modify the wg.gs f parameter]
#********************************************************
#Wname="name"

logfile="/wrf/LOG/$Wname/setConfig.log"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" > $logfile
echo "< setConfig shell start at " $date ">" >> $logfile
echo "	" >> $logfile



newOutputRootName_date=`date +%Y%m%d`
#-------------

#modify /wrf/LIBRARIES/WindFarmConfig/$Wname/wg.gs
oldWgGs_date=`awk '$1=="'\''open"{split( $2, date, "/" ); print date[6]}' /wrf/LIBRARIES/WindFarmConfig/$Wname/wg.gs`
sed -i "s/$oldWgGs_date/$newOutputRootName_date/g"     /wrf/LIBRARIES/WindFarmConfig/$Wname/wg.gs  

#replace the wg.gs file
rm /wrf/LIBRARIES/grads-2.1.a3/bin/wg.gs -rf
cp -r -f /wrf/LIBRARIES/WindFarmConfig/$Wname/wg.gs  /wrf/LIBRARIES/grads-2.1.a3/bin/

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	" >> $logfile
echo "< setConfig shell finished at " $date ">" >> $logfile
echo "	" >> $logfile



#!/bin/bash
#0 is ready,   1 is busy

source /wrf/LIBRARIES/shell/optLock/MLockInc.sh

lockWps=`awk -F "=" 'NR=='$nLockWps' {print $2}' $lockStatusFile`
lockInput=`awk -F "=" 'NR=='$nLockInput' {print $2}' $lockStatusFile`
lockARWpost=`awk -F "=" 'NR=='$nLockARWpost' {print $2}' $lockStatusFile`
lockGs=`awk -F "=" 'NR=='$nLockGs' {print $2}' $lockStatusFile`

sed -i "$nLockWps s/$lockWps/0/g" $lockStatusFile
sed -i "$nLockInput s/$lockInput/0/g" $lockStatusFile
sed -i "$nLockARWpost s/$lockARWpost/0/g"  $lockStatusFile
sed -i "$nLockGs s/$lockGs/0/g" $lockStatusFile



#!/bin/bash

source /wrf/LIBRARIES/shell/optLock/MLockInc.sh
LineNum=$1
echo $LineNum
echo "sleep --- --- --- "

sleep 5
sed -i ''$LineNum' s/1/0/g' $lockStatusFile


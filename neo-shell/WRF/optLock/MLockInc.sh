#!/bin/bash 
lockStatusFile="/wrf/LIBRARIES/shell/optLock/lockStatus.file"

nLockWps=`awk -F "=" '$1=="mutexLock_wps" {print NR}' $lockStatusFile`
nLockInput=`awk -F "=" '$1=="mutexLock_input" {print NR}' $lockStatusFile`
nLockARWpost=`awk -F "=" '$1=="mutexLock_ARWpost" {print NR}' $lockStatusFile` 
nLockGs=`awk -F "=" '$1=="mutexLock_gs" {print NR}' $lockStatusFile`

#echo $nlockwps
#echo $nlockinput
#echo $nlockarwpost
#echo $nlockgs



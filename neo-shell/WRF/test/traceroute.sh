#!/bin/bash
tracerouteLog="/wrf/LOG/traceroute/traceroute"`date -d "+1 day" +%Y%m%d`".log"

runtime=`date +%Y-%m-%d_%H:%M:%S`
echo "< Run Time is :"$runtime" >" >> $tracerouteLog
traceroute 140.90.101.61 >> $tracerouteLog
echo "" >> $tracerouteLog
echo "" >> $tracerouteLog


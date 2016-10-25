#!/bin/bash
WFCfgFile="/wrf/run_GFS/shell/CP_Windfarm_1.cfg"
ConfigDirPath="/wrf/run_GFS/WindFarmConfig"
ResultDirPath="/wrf/run_GFS/RESULT"
ProgramFiles="/wrf/run_GFS/shell/Exe/*"
LogDirPath="/wrf/LOG"

#declare -a wfNameArray

while read LINE
do
	if [ "#" != "${LINE:0:1}" ]
	then
		tempArr=(${LINE//::/ })
		CPName=${tempArr[0]}
		echo $CPName
		
		cd $ConfigDirPath
		rm $CPName -r -f

		cd $ResultDirPath
		rm $CPName -r -f
		
		cd $LogDirPath
		rm $CPName -r -f

	fi

done < $WFCfgFile

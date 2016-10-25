#!/bin/bash
WFCfgFile="/wrf/LIBRARIES/shell/test/windfarm.cfg"
ConfigDirPath="/wrf/LIBRARIES/WindFarmConfigT"
ResultDirPath="/wrf/LIBRARIES/RESULTT"
ProgramFiles="/wrf/LIBRARIES/shell/Exe/*"
LogDirPath="/wrf/LOGT"

#declare -a wfNameArray

while read LINE
do
	if [ "#" != ${LINE:0:1} ]
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

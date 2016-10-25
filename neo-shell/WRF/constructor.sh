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
		PointStr=${tempArr[1]}
		echo $CPName
	    echo $PointStr	

		cd $ConfigDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ]
		then
			echo "create directory $ConfigDirPath/$CPName "
			mkdir $CPName
			cp $ProgramFiles ./$CPName/ -R -f 
			/wrf/run_GFS/shell/makeGsScript.sh $CPName $PointStr 
			/wrf/run_GFS/shell/initWFConfig.sh $CPName $PointStr

		else
			echo "cannot create directory $CPName File Exists : in $ConfigDirPath"
		fi


		cd $ResultDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ] 
		then
			echo "create directory $ResultDirPath/$CPName "
			mkdir $CPName
		else
			echo "cannot create directory $CPName File Exists : in $ResultDirPath"
		fi

		
		cd $LogDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ]
		then
			echo "create directory $LogDirPath/$CPName "
			mkdir $CPName
		else
			echo "cannot create directory $CPName File Exists : in $LogDirPath"
		fi
	fi

done < $WFCfgFile

#!/bin/bash
WFCfgFile="/wrf/LIBRARIES/shell/test/CP_Windfarm_2.cfg"
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
		PointStr=${tempArr[1]}
		#echo $CPName
	    #echo $PointStr	

		cd $ConfigDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ]
		then
			echo "create directory $ConfigDirPathfind/$CPName "
			mkdir $CPName
			cp $ProgramFiles ./$CPName/ -R -f 
			/wrf/LIBRARIES/shell/test/makeGsScript.sh $CPName $PointStr 
		else
			echo "cannot create directory $CPName File Exists"
		fi


		cd $ResultDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ] 
		then
			echo "create directory $ResultDirPath/$CPName "
			mkdir $CPName
		else
			echo "cannot create directory $CPName File Exists"
		fi

		
		cd $LogDirPath
		find=`find ./ -type d -name "$CPName" | wc -l`
		if [ $find -eq 0 ]
		then
			echo "create directory $LogDirPath/$CPName "
			mkdir $CPName
		else
			echo "cannot create directory $CPName File Exists"
		fi
	fi

done < $WFCfgFile

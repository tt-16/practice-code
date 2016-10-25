#!/bin/bash

CPName=$1
#lonlat="Huangh_117.57530100_38.58906018;Huangh_117.57530100_38.58906018;wangf_117.59937060_38.56585363;Center_114.2384891_41.12783249"
LON_LAT=$2
#LON_LAT=$lonlat


POINT_NUM=`echo "$LON_LAT"|awk -F ";" '{print NF}'`
echo $POINT_NUM
GsFile="/wrf/run_GFS/WindFarmConfig/$CPName/grads-2.1.a3/bin/wg.gs"


echo $LON_LAT
echo $CPName

touch $GsFile
cat /dev/null > $GsFile 

echo "'open /wrf/run_GFS/RESULT/$CPName/20150716/test.ctl'" >> $GsFile

echo "'set gxout print'" >> $GsFile
echo "'set prnopts %f 1'" >> $GsFile
echo "filename = \"out.txt\"" >> $GsFile
echo "rc = write(filename, \"\")" >> $GsFile
echo "rc = write(filename,\"lon-lat:$LON_LAT\")" >> $GsFile
echo "rc = write(filename,\"PointNum:$POINT_NUM\")" >> $GsFile
echo "" >> $GsFile



echo "*================================================================================*" >> $GsFile

i=1
while [ $i -le $POINT_NUM ]
do

	lon=`echo "$LON_LAT"|awk -F ";" '{print $'$i'}'|awk -F "_" '{print $2}'`
	lat=`echo "$LON_LAT"|awk -F ";" '{print $'$i'}'|awk -F "_" '{print $3}'`
	wfName=`echo "$LON_LAT"|awk -F ";" '{print $'$i'}'|awk -F "_" '{print $1}'`
	echo $lon
	echo $lat
	echo $wfName 
	if [ "$prevName" == "$wfName" ]
	then
		let PN+=1
	else
		#PN=1
		let PN+=1
		prevName=$wfName
	fi
	

    echo "*point#$PN*" >> $GsFile
    echo "'set lon $lon'" >> $GsFile
    echo "'set lat $lat'" >> $GsFile
    echo "'set t 113 209'" >> $GsFile
    echo "" >> $GsFile
 
    
    echo "*  10m风速 *" >> $GsFile
    echo "'set lev 2'" >> $GsFile
    echo "'d u'" >> $GsFile
    echo "rc = write(filename, \"variable:u:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d v'" >> $GsFile
    echo "rc = write(filename, \"variable:v:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d tc'" >> $GsFile
    echo "rc = write(filename, \"variable:temperature:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d rh'" >> $GsFile
    echo "rc = write(filename, \"variable:Humidity:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d pressure'" >> $GsFile
    echo "rc = write(filename, \"variable:pressure:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "*  30m风速 *" >> $GsFile
    echo "'set lev 4'" >> $GsFile
    echo "'d u'" >> $GsFile
    echo "rc = write(filename, \"variable:u:30:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d v'" >> $GsFile
    echo "rc = write(filename, \"variable:v:30:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d tc'" >> $GsFile
    echo "rc = write(filename, \"variable:temperature:30:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d rh'" >> $GsFile
    echo "rc = write(filename, \"variable:Humidity:30:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d pressure'" >> $GsFile
    echo "rc = write(filename, \"variable:pressure:30:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "*  50m风速 *" >> $GsFile
    echo "'set lev 6'" >> $GsFile
    echo "'d u'" >> $GsFile
    echo "rc = write(filename, \"variable:u:50:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d v'" >> $GsFile
    echo "rc = write(filename, \"variable:v:50:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d tc'" >> $GsFile
    echo "rc = write(filename, \"variable:temperature:50:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d rh'" >> $GsFile
    echo "rc = write(filename, \"variable:Humidity:50:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d pressure'" >> $GsFile
    echo "rc = write(filename, \"variable:pressure:50:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "*  70m风速 *" >> $GsFile
    echo "'set lev 8'" >> $GsFile
    echo "'d u'" >> $GsFile
    echo "rc = write(filename, \"variable:u:70:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d v'" >> $GsFile
    echo "rc = write(filename, \"variable:v:70:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d tc'" >> $GsFile
    echo "rc = write(filename, \"variable:temperature:70:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d rh'" >> $GsFile
    echo "rc = write(filename, \"variable:Humidity:70:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d pressure'" >> $GsFile
    echo "rc = write(filename, \"variable:pressure:70:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "*  90m风速 *" >> $GsFile
    echo "'set lev 9'" >> $GsFile
    echo "'d u'" >> $GsFile
    echo "rc = write(filename, \"variable:u:90:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d v'" >> $GsFile
    echo "rc = write(filename, \"variable:v:90:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d tc'" >> $GsFile
    echo "rc = write(filename, \"variable:temperature:90:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d rh'" >> $GsFile
    echo "rc = write(filename, \"variable:Humidity:90:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'d pressure'" >> $GsFile
    echo "rc = write(filename, \"variable:pressure:90:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    
    echo "'set lev 1'" >> $GsFile
    echo "*降雨量*" >> $GsFile
    echo "'d rainc+rainnc'" >> $GsFile
    echo "rc = write(filename, \"variable:precipitation:10:#"$PN"\")" >> $GsFile
    echo "rc = write(filename, result)" >> $GsFile
    echo "" >> $GsFile
    
    echo "*=================================================================================*" >> $GsFile
    echo "" >> $GsFile
	#let i+=1
	let i=$i+1
done

echo "res = close(filename)" >> $GsFile
echo "'quit'" >> $GsFile

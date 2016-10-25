#!/bin/bash
CPName=$1
PointStr=$2
WINDFARMDIR="/wrf/run_GFS/WindFarmConfig/"
ARWPOSTPATH="/ARWpost/namelist.ARWpost"
WPSPATH="/WPS/namelist.wps"

#echo $CPName
#echo $PointStr
newRefLat=`echo $PointStr | awk -F "Center" '{print $2}' | awk -F "_" '{print $3}'`
newRefLon=`echo $PointStr | awk -F "Center" '{print $2}' | awk -F "_" '{print $2}'`
#echo $newRefLat
#echo $newRefLon

oldInputName=`awk '$1=="input_root_name"{split($3,arrData,"/");print arrData[5]}' $WINDFARMDIR$CPName$ARWPOSTPATH`
InputNameNR=`awk '$1=="input_root_name"{print NR}' $WINDFARMDIR$CPName$ARWPOSTPATH`

oldOutputName=`awk '$1=="output_root_name"{split($3,arrData,"/");print arrData[5]}' $WINDFARMDIR$CPName$ARWPOSTPATH`
OutputNameNR=`awk '$1=="output_root_name"{print NR}' $WINDFARMDIR$CPName$ARWPOSTPATH`

oldRefLat=`awk '$1=="ref_lat" {print $3}' $WINDFARMDIR$CPName$WPSPATH`
oldRefLon=`awk '$1=="ref_lon" {print $3}' $WINDFARMDIR$CPName$WPSPATH`
oldStandLon=`awk '$1=="stand_lon" {print $3}' $WINDFARMDIR$CPName$WPSPATH`
RefLatNR=`awk '$1=="ref_lat" {print NR}' $WINDFARMDIR$CPName$WPSPATH`
RefLonNR=`awk '$1=="ref_lon" {print NR}' $WINDFARMDIR$CPName$WPSPATH`
StandLonNR=`awk '$1=="stand_lon" {print NR}' $WINDFARMDIR$CPName$WPSPATH`

sed -i "$InputNameNR s/$oldInputName/$CPName/g" "$WINDFARMDIR$CPName$ARWPOSTPATH"
sed -i "$OutputNameNR s/$oldOutputName/$CPName/g" "$WINDFARMDIR$CPName$ARWPOSTPATH"
sed -i "$RefLatNR s/$oldRefLat/$newRefLat/g" "$WINDFARMDIR$CPName$WPSPATH"
sed -i "$RefLonNR s/$oldRefLon/$newRefLon/g" "$WINDFARMDIR$CPName$WPSPATH"
sed -i "$StandLonNR s/$oldStandLon/$newRefLon/g" "$WINDFARMDIR$CPName$WPSPATH"

#echo $oldInputName
#echo $InputNameNR
#echo $oldOutputName
#echo $OutputNameNR
#echo $oldRefLat
#echo $oldRefLon
#echo $oldStandLon
#echo $RefLatNR
#echo $RefLonNR
#echo $StandLonNR

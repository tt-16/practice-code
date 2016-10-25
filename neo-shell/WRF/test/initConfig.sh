#!/bin/bash

CPName=$1
Latitude=$2
Longitude=$3
WPSFilePath="/wrf/LIBRARIES/WindFarmConfigT/$CPName/WPS/namelist.wps"
ARWpostFilePath="/wrf/LIBRARIES/WindFarmConfigT/$CPName/ARWpost/namelist.ARWpost"
GSFilePath="/wrf/LIBRARIES/WindFarmConfigT/$CPName/grads-2.1.a3/bin/wg.gs"
InputFilePath="/wrf/LIBRARIES/WindFarmConfigT/$CPName/WRFV3/test/em_real/namelist.input"
ARWpostInputPath="'/wrf/LIBRARIES/WindFarmConfigT/$CPName/wrfout_d03_2015_07_16_15:00:00'"
ARWpostOutputPath="'/wrf/LIBRARIES/RESULT/$CPName/20150716/test'"


sed -i '/ref_lat/s/\(ref_lat\).*/\1 = '$Latitude'/g' $WPSFilePath
sed -i '/ref_lon/s/\(ref_lon\).*/\1 = '$Longitude'/g' $WPSFilePath
sed -i '/stand_lon/s/\(stand_lon\).*/\1 = '$Longitude'/g' $WPSFilePath

sed -i '/input_root_name/s/\(input_root_name\).*/\1 = '$ARWpostInputPath'/g' $ARWpostFilePath
sed -i '/output_root_name/s/\(output_root_name\).*/\1 = '$ARWpostOutputPath'/g' $ARWpostFilePath


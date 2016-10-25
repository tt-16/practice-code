#!/bin/bash
Wname="huanghua"
max_dom=`gawk -F " " 'NR==3{print substr($3,1,1)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps`

echo $Wname ":"
echo $max_dom

echo `awk '$1=="start_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps`
echo `awk '$1=="end_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.wps`


echo `awk '$1=="start_year"{print substr($3,1,4)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="start_year"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`

echo `awk '$1=="start_month"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="start_month"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`

echo `awk '$1=="start_day"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="start_day"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`

echo `awk '$1=="end_year"{print substr($3,1,4)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="end_year"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`

echo `awk '$1=="end_month"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="end_month"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`

echo `awk '$1=="end_day"{print substr($3,1,2)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`
echo `awk '$1=="end_day"{print NR}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.input`


echo `awk '$1=="start_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
echo `awk '$1=="end_date"{print substr($3,2,19)}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
echo `awk '$1=="output_root_name"{split( $3, date, "/" ); print date[6]}' /wrf/LIBRARIES/WindFarmConfig/$Wname/namelist.ARWpost`
#'open /wrf/LIBRARIES/RESULT/20150515/test.ctl'
echo `awk '$1=="'\''open"{split( $2, date, "/" ); print date[6]}' /wrf/LIBRARIES/WindFarmConfig/$Wname/wg.gs`
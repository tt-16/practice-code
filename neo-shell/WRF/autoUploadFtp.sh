#!/bin/bash

if [ $# -eq 1 ]
then		
dataType="$1"
else
dataType="0000"
fi


if [ $dataType == "0000" ]
then
filedate="12"
elif [ $dataType == "0600" ]
then
filedate="18"
elif [ $dataType == "1200" ]
then
filedate="00"
elif [ $dataType == "1800" ]
then
filedate="06"
fi


#echo "$dataType  $filedate"

ftp -n<<!
	open 123.57.204.106 
	user test tsingsoft2015
	binary
	cd /weather/wrf/WRF_$filedate
	prompt
	mput *"$filedate".WPD
	cd /weather/wrf
	mput *00.WPD
	mput *12.WPD
	close
	bye
!

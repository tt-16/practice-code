#!/bin/bash
ChangedScript="$1"
ServerNum=$2
if [ $ServerNum -eq 1 ]
then
ftp -n<<!
        open 47.88.23.136
        user ecmwf ecmwf2015
        binary
	cd SynchroScripts
        put $ChangedScript
        close
		bye
!
elif [ $ServerNum -eq 2 ]
then
ftp -n<<!
        open 47.88.27.131 
        user ecmwf ecmwf2015
        binary
	cd SynchroScripts
        put $ChangedScript
        close
		bye
!
elif [ $ServerNum -eq 3 ]
then
ftp -n<<!
        open 47.88.7.71 
        user ecmwf ecmwf2015
        binary
	cd SynchroScripts
        put $ChangedScript
        close
		bye
!
fi



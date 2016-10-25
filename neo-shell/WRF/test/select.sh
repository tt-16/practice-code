#!/bin/bash

OPTIONS="ONE Quit"
select opt in $OPTIONS
do
		if [ "$opt"="Quit" ]
		then
			echo done
			exit
		elif [ "$opt"="ONE" ]
		then
			echo "do one"
		else
			clear
			echo bad option
		fi
done

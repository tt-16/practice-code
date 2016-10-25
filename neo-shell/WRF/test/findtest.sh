#!/bin/bash

find=`find ./ -type d -name "HT" | wc -l`

if [ $find -eq 0 ]
then
	echo "not fond directory or file"
else
	echo "fond the directory or file $find"
fi


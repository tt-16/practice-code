#!/bin/bash
CENTPOINTS=`awk -F":" '$1=="1" {print}' ./task_1.cfg`
ARRSIZE=`awk -F":" '$1=="1" {print NF}' ./task_1.cfg`
#echo $ARRSIZE

arr=(${CENTPOINTS//:/ })
#echo ${#arr[@]}

i=2
while [ $i -le $ARRSIZE ]
do
	echo "${arr[$i-1]}"
	let i=$i+1
done

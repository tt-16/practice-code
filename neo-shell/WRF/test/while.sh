#!/bin/bash

TASKMAX=15
i=1

while [ $i -le $TASKMAX ]
do
	#let i+=1
	#nohup ./task.sh $i &
	./task.sh $i 
	let i=$i+1
		
done 

#!/bin/bash

echo "delete test.ctl"
find /wrf/run_GFS/RESULT/ -type f -name "test.ctl" | wc -l
find /wrf/run_GFS/RESULT/ -type f -name "test.ctl" | xargs rm -rf

echo "delete test.dat"
find /wrf/run_GFS/RESULT/ -type f -name "test.dat" | wc -l
find /wrf/run_GFS/RESULT/ -type f -name "test.dat" | xargs rm -rf

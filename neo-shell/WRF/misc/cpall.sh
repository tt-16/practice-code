#!/bin/bash

cp /wrf/LIBRARIES/WRFV3/main ./ -r -f
cp /wrf/LIBRARIES/WRFV3/run ./ -r -f
mkdir ./test
cp /wrf/LIBRARIES/WRFV3/test/em_real ./test/ -r -f

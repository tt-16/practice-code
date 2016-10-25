#!/bin/bash


find /wrf/DATA -type d -name 201506* -exec cp {} /wrf2/backup/DATA/ -R \;

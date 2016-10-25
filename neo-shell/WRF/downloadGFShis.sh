#!/bin/bash
startdate=$1
enddate=$2

ExtendArgs="--retry 30 --retry-delay 50"
loopdays=`echo $(( ($(date -d "$enddate" +%s) - $(date -d "$startdate" +%s)) / (24*60*60) ))`
i=0
while [ $i -le $loopdays ]
do
		vDate=`date -d ''$startdate' + '$i' day' +%Y%m%d`
		cd  /wrf/DATA/
		mkdir $vDate
		cd $vDate
		prveDate=`date -d ''$vDate' -1 day' +%Y%m%d`
		gfsDate=`date -d ''$vDate'' +%Y%m%d`
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f027

		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f030

		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f033
		gfsDate=`date -d ''$vDate' + 1 day' +%Y%m%d`
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f036
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f039
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f042
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f045
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f048
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f051
		curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f054

		echo "prveDate is $prveDate  gfsDate is $gfsDate" 

		let i=$i+1
done



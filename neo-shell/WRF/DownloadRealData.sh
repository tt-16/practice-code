#!/bin/bash

#************************************************************
#  实时数据数据下载脚本
#  下载过程记录在日志文件中 logfile="/wrf/LOG/DownloadReal.log"
#************************************************************

logfile="/wrf/LOG/downloadReal.log"
ExtendArgs="--retry 30 --retry-delay 50"

prveDate=`date --date='-48 hour' +%Y%m%d`
gfsDate=`date +%Y%m%d`
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"00/gfs.t00z.pgrb2.0p25.f000" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""00/gfs.t00z.pgrb2.0p25.f000
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_00h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"00/gfs.t00z.pgrb2.0p25.f003" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""00/gfs.t00z.pgrb2.0p25.f003
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_03h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"06/gfs.t06z.pgrb2.0p25.f000" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""06/gfs.t06z.pgrb2.0p25.f000
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_06h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"06/gfs.t06z.pgrb2.0p25.f003" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""06/gfs.t06z.pgrb2.0p25.f003
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_09h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"12/gfs.t12z.pgrb2.0p25.f000" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f000
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_12h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"12/gfs.t12z.pgrb2.0p25.f003" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""12/gfs.t12z.pgrb2.0p25.f003
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_15h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"18/gfs.t18z.pgrb2.0p25.f000" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""18/gfs.t18z.pgrb2.0p25.f000
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate"18/gfs.t18z.pgrb2.0p25.f003" >> $logfile
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.""$prveDate""18/gfs.t18z.pgrb2.0p25.f003
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_21h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	< Download finished at  :" $date ">" >> $logfile
echo "	=============================================================  ">> $logfile
echo "	">> $logfile

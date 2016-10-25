
#  数据下载脚本
#  下载过程记录在日志文件中 logfile="/wrf/LOG/download.log"
#************************************************************

logfile="./download.log"
ExtendArgs="--retry 30 --retry-delay 50"
if [ $# -eq 1 ]
then
dataType="$1"
else
dataType="0000"
fi


if [ $dataType == "0000" ]
then
Fdate="00"
prveDate=`date +%Y%m%d`
Fnum=0
elif [ $dataType == "0600" ]
then
Fdate="06"
prveDate=`date +%Y%m%d`
Fnum=9
elif [ $dataType == "1200" ]
then
Fdate="12"
prveDate=`date --date='-24 hour' +%Y%m%d`
Fnum=0
elif [ $dataType == "1800" ]
then
Fdate="18"
prveDate=`date --date='-24 hour' +%Y%m%d`
Fnum=21
fi

date=`date +%Y-%m-%d_%H:%M:%S`
echo "	=============================================================  "> $logfile
echo "	< Download Start at  :" $date ">" >> $logfile
echo "	"i>> $logfile

gfsDate=`date --date='-24 hour' +%Y%m%d`
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f027" >> $logfile
if [ $Fnum -lt 10 ]
then
	Filenum=0"$Fnum"
else
	Filenum="$Fnum"
fi
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_15h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

let Filenum=$Fnum+3
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f030" >> $logfile
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

let Filenum=$Fnum+6
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f033" >> $logfile
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_21h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

let Filenum=$Fnum+9
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f036" >> $logfile
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f00"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_00h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

gfsDate=`date +%Y%m%d`
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f039" >> $logfile
let Filenum=$Fnum+12
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_03h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f042" >> $logfile
let Filenum=$Fnum+15
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_06h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f045" >> $logfile
let Filenum=$Fnum+18
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_09h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f048" >> $logfile
let Filenum=$Fnum+21
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_12h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f051" >> $logfile
let Filenum=$Fnum+24
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_15h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+27
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+30
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+33
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

gfsDate=`date --date='+24 hour' +%Y%m%d`
echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+36
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+39
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+42
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+45
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+48
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+51
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
let Filenum=$Fnum+54
echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
date=`date +%Y-%m-%d_%H:%M:%S`
echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
echo "	@> $?" >> $logfile
echo "	" >> $logfile

#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+57
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#gfsDate=`date --date='+48 hour' +%Y%m%d`
#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+60
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+63
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+66
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+69
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#echo "	#>     curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_"$gfsDate"_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f054" >> $logfile
#let Filenum=$Fnum+72
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+75
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+78
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+81
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_21h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#gfsDate=`date --date='+72 hour' +%Y%m%d`
#let Filenum=$Fnum+84
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+87
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+90
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+93
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_09h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+96
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+99
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_15h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#let Filenum=$Fnum+102
#if [ $Filenum -gt 100 ]
#then
#	Fileend="$Filenum"
#else
#	Fileend=0"$Filenum"
#fi
#echo "#####  Downloading gsf/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f0"$Filenum"  #####"
#curl $ExtendArgs --disable-epsv --connect-timeout 30 -u anonymous:USER_ID@INSTITUTION -o GFS_""$gfsDate""_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$prveDate""$Fdate"/gfs.t"$Fdate"z.pgrb2.0p50.f"$Fileend"
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	       GFS_"$gfsDate"_18h data download finished at" $date >> $logfile
#echo "	@> $?" >> $logfile
#echo "	" >> $logfile
#
#date=`date +%Y-%m-%d_%H:%M:%S`
#echo "	< Download finished at  :" $date ">" >> $logfile
#echo "	=============================================================  ">> $logfile
#echo "	">> $logfile

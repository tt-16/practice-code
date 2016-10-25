#*************************************************************
#  [配置定时任务脚本]
#  配置每日00:00自动执行 /wrf/LIBRARIES/shell/run.sh
#  配置每日03:00自动执行 /wrf/LIBRARIES/shell/wrf.sh
#  重启定时任务
#*************************************************************

#测试
#echo "13  19 * * * root /wrf/LIBRARIES/shell/crontest.sh" >> /etc/crontab
#echo "0  20 * * * root /wrf/LIBRARIES/shell/crontest.sh" >> /etc/crontab

#echo "0  0  * * * root /wrf/LIBRARIES/shell/run.sh" >> /etc/crontab
#echo "0  3  * * * root /wrf/LIBRARIES/shell/wrf.sh" >> /etc/crontab

#echo "0  4  * * * root /wrf/LIBRARIES/shell/loop.sh" >> /etc/crontab

/sbin/service crond stop
/sbin/service crond start

@echo off

ECHO %1
ECHO %2
ECHO %3

echo 当前盘符: %~d0
echo 当前盘符和路径: %~dp0
echo 当前盘符和路径的短文件名: %~sdp0
echo 当前批处理全路径: %~f0
echo 当前CMD默认目录: %cd%



PAUSE
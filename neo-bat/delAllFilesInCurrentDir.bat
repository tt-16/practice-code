@echo off 

::::::::::::::::::::::::::::::::
::删除当前盘符和路径下的所有文件
::::::::::::::::::::::::::::::::

echo 当前盘符和路径: %~dp0

for /r %%i in (*) do (
rem del %%i
echo %%i
)
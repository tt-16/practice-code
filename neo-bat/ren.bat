@echo off 
setlocal enableDelayedExpansion
for %%m in (*) do (
    if not "%%m"=="%~nx0" (
    	if not "%%~xm" == "bat" (
    		set /a num+=1
    		rem set sstr=%%~nm
    		rem set sstr=!sstr:~3！
        rem ren "%%m" "!num!!sstr!%%~xm"
        set str=%%m
        set str=!str:~4!
        echo "2016!str!%%~xm"
        rem &set str=!str:~1! 
   			rem ren "%%a" "!str!" 
    	)
    )
)
echo 改名完成！
pause


rem  %%~nm  -  %%m的名称
rem  %%~xm  -  %%m的扩展名
rem  %~nx0  -  当前bat的全名
rem  str:~4 -  变量中字符串取第4位到结束
@echo off 

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::批量修改当前脚本所在目录下的文件名称，将名称前四位2014替换成2016
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


setlocal enableDelayedExpansion
for %%m in (*) do (
		set /a all+=1
		
    if not "%%m"=="%~nx0" (
    	if not "%%~xm" == "bat" (
    		set sstr=%%~nm
    		set sstr=!sstr:~0,4!
        rem echo #Test: !all! !sstr! %%~xm
        
        if "!sstr!"=="2014" (
        	set /a num+=1
        	set str=%%m
        	set str=!str:~4!
        	rem echo "2016!str! %%~xm"
        	ren "%%m" "2016!str!"
        ) 
    	)
    )
    
)
echo "共 !all! 文件  !num! 个文件改名完成"
pause


rem  %%~nm  -  %%m的名称
rem  %%~xm  -  %%m的扩展名
rem  %~nx0  -  当前bat的全名
rem  str:~4 -  变量中字符串取第4位到结束
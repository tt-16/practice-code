@echo off 
setlocal enableDelayedExpansion
for %%m in (*) do (
    if not "%%m"=="%~nx0" (
    	if not "%%~xm" == "bat" (
    		set /a num+=1
    		rem set sstr=%%~nm
    		rem set sstr=!sstr:~3��
        rem ren "%%m" "!num!!sstr!%%~xm"
        set str=%%m
        set str=!str:~4!
        echo "2016!str!%%~xm"
        rem &set str=!str:~1! 
   			rem ren "%%a" "!str!" 
    	)
    )
)
echo ������ɣ�
pause


rem  %%~nm  -  %%m������
rem  %%~xm  -  %%m����չ��
rem  %~nx0  -  ��ǰbat��ȫ��
rem  str:~4 -  �������ַ���ȡ��4λ������
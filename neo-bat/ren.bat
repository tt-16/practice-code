@echo off 

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�����޸ĵ�ǰ�ű�����Ŀ¼�µ��ļ����ƣ�������ǰ��λ2014�滻��2016
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
echo "�� !all! �ļ�  !num! ���ļ��������"
pause


rem  %%~nm  -  %%m������
rem  %%~xm  -  %%m����չ��
rem  %~nx0  -  ��ǰbat��ȫ��
rem  str:~4 -  �������ַ���ȡ��4λ������
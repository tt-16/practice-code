@echo off 

::::::::::::::::::::::::::::::::
::for循环中各个参数的含义和用法
::::::::::::::::::::::::::::::::

setlocal enableDelayedExpansion
for %%m in (*) do (
		ECHO  "FOR 参数扩展示例"
		echo  %%m
    echo  %%~nm 
		echo  %%~xm 
		echo  %~nx0
		
		echo  %%~fm        
    echo  %%~dm        
    echo  %%~pm        
    echo  %%~nm        
    echo  %%~xm        
    echo  %%~sm        
    echo  %%~am        
    echo  %%~tm        
    echo  %%~zm        
)
echo 改名完毕！！！！
pause

rem 		 ~I         - 删除任何引号(")，扩充 %I
rem     %~fI        - 将 %I 扩充到一个完全合格的路径名
rem     %~dI        - 仅将 %I 扩充到一个驱动器号
rem     %~pI        - 仅将 %I 扩充到一个路径
rem     %~nI        - 仅将 %I 扩充到一个文件名
rem     %~xI        - 仅将 %I 扩充到一个文件扩展名
rem     %~sI        - 扩充的路径只含有短名
rem     %~aI        - 将 %I 扩充到文件的文件属性
rem     %~tI        - 将 %I 扩充到文件的日期/时间
rem     %~zI        - 将 %I 扩充到文件的大小
rem     %~$PATH:I   - 查找列在路径环境变量的目录，并将 %I 扩充到找到的第一个完全合格的名称。如果环境变量名未被定义，或者没有找到文件，此组合键会扩充到空字符串



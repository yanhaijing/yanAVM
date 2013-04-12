@echo off
title 颜海镜AVM4.0beta版

:main
rem 错误提示变量初始化
set varError=
mode con cols=50 lines=18
echo %~1|findstr /ie ".asm">null||(set varError=编译文件扩展名为%~x1非.asm&goto :sorry)
color 4a
echo            ☆☆☆☆☆☆☆☆☆☆☆☆☆   
echo            ☆       颜海镜AVM      ☆
echo            ☆☆☆☆☆☆☆☆☆☆☆☆☆
echo.
echo     颜海镜是一种理念
echo.
echo     我们每天都在努力，只为更好为您服务
echo  ----------------------------------------------  
echo   将要汇编的文件拖到我上面 (*^__^*) 嘻嘻...
echo.   
echo   确认汇编请按【回车】，否则请直接关闭此窗口...
echo  ------------------------------------------------
pause>nul
mode con lines=44

rem ===以下为创建目标文件夹===
if not exist %~dp1YanMasm\obj\lst (
echo 正在创建%~dp1YanMasm\obj\lst\...&md %~dp1YanMasm\obj\lst\ 2>null||(set varError=创建%~dp1YanMasm\obj\lst失败&goto :sorry)
)
if not exist %~dp1YanMasm\obj\crf (
echo 正在创建%~dp1YanMasm\obj\crf\...&md %~dp1YanMasm\obj\crf\ 2>null||(set varError=创建%~dp1YanMasm\obj\crf失败&goto :sorry)
) 
if not exist %~dp1YanMasm\exe\map (
echo 正在创建%~dp1YanMasm\exe\map\...&md %~dp1YanMasm\exe\map\ 2>null||(set varError=创建%~dp1YanMasm\exe\map失败&goto :sorry)
)

rem ===注册环境变量===
echo 注册环境变量...
echo %path%|find "%~dp0"||set path=%path%;%~dp0
set path
pause

rem ===初始化YanAVM=== 
echo 正在初始化，请稍候...
if exist %~dp1YanMasm\obj\crf\%~n1.crf (
del /q /f %~dp1YanMasm\obj\crf\%~n1.crf&echo 正在初始化%~n1.crf...
)
if exist %~dp1YanMasm\obj\lst\%~n1.lst (
del /q /f %~dp1YanMasm\obj\lst\%~n1.lst&echo 正在初始化%~n1.lst...
)
if exist %~dp1YanMasm\exe\map\%~n1.map (
del /q /f %~dp1YanMasm\exe\map\%~n1.map&echo 正在初始化%~n1.map...
)
if exist %~dp1YanMasm\exe\%~n1.exe (
del /q /f %~dp1YanMasm\exe\%~n1.exe&echo 正在初始化%~n1.exe...
)

rem ===masm===
echo 正在masming...
masm %~dp1%~nx1,%~dp1YanMasm\obj\,%~dp1YanMasm\obj\lst\,%~dp1YanMasm\obj\crf\;
if not exist %~dp1YanMasm\obj\%~n1.obj (set varError=no find %~dp1YanMasm\obj\%~n1.obj&goto :error)
echo masm successfullly...

rem ===link===
echo linking...
link %~dp1YanMasm\obj\%~n1.obj,%~dp1YanMasm\exe\,%~dp1YanMasm\exe\map\,;
if exist %~dp1YanMasm\exe\%~n1.exe (
echo link successfullly...&start %~dp1YanMasm\exe\%~n1.exe) else (
set varError=no find %~dp1YanMasm\exe\%~n1.exe&goto :error
)

rem ===运行成功提示===
mode con cols=50 lines=12
color 2f
echo.
echo              YanhaijingTD      
echo            QQ Qun:55306466    
echo.
echo   Congratulate! Output %~dp1YanMasm\
echo.
echo   debug: 1+enter  quit: enter
echo  ----------------------------------------
echo                          Yanhaijing

set /p var=  please input  choice:
if %var%==1 (
if exist %~dp1YanMasm\exe\%~n1.exe mode con cols=80 lines=44&title YanAVMdebug4.0beta&color f8&cls&debug %~dp1YanMasm\exe\%~n1.exe
)
:end
exit
rem ===main函数结束===

rem ===初始化错误提示===
:sorry
color f5
title 颜海镜AVM4.0beta informations
if "%varError%"=="" set varError=未知的错误
echo.&echo.&echo.&echo.
echo      ！！！看来出了些问题 ！！！     
echo.
echo      很遗憾-_-。sorry！没能帮你解决问题
echo.
echo      错误：%varError%
echo.
echo      请放心，我们的工程师已经着手解决此问题
echo.
echo  --------------------------------------------
echo.
echo          若要退出请直接关闭此窗口...
echo.
echo                              颜海镜
pause>nul
exit
goto :eof

rem ===编译出错提示===
:error
color f5
title YanAVM4.0beta informations
if "%varError%"=="" set varError=Unknown error
echo   ---------------------------------------
echo 	something is wrong...
echo.
echo 	error:%varError%
echo.
echo 	Press any key to quit...
echo   ---------------------------------------
echo                          Yanhaijing 
pause>nul
exit
goto :eof
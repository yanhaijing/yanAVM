@echo off
title �պ���AVM4.0beta��

:main
rem ������ʾ������ʼ��
set varError=
mode con cols=50 lines=18
echo %~1|findstr /ie ".asm">null||(set varError=�����ļ���չ��Ϊ%~x1��.asm&goto :sorry)
color 4a
echo            ��������������   
echo            ��       �պ���AVM      ��
echo            ��������������
echo.
echo     �պ�����һ������
echo.
echo     ����ÿ�춼��Ŭ����ֻΪ����Ϊ������
echo  ----------------------------------------------  
echo   ��Ҫ�����ļ��ϵ������� (*^__^*) ����...
echo.   
echo   ȷ�ϻ���밴���س�����������ֱ�ӹرմ˴���...
echo  ------------------------------------------------
pause>nul
mode con lines=44

rem ===����Ϊ����Ŀ���ļ���===
if not exist %~dp1YanMasm\obj\lst (
echo ���ڴ���%~dp1YanMasm\obj\lst\...&md %~dp1YanMasm\obj\lst\ 2>null||(set varError=����%~dp1YanMasm\obj\lstʧ��&goto :sorry)
)
if not exist %~dp1YanMasm\obj\crf (
echo ���ڴ���%~dp1YanMasm\obj\crf\...&md %~dp1YanMasm\obj\crf\ 2>null||(set varError=����%~dp1YanMasm\obj\crfʧ��&goto :sorry)
) 
if not exist %~dp1YanMasm\exe\map (
echo ���ڴ���%~dp1YanMasm\exe\map\...&md %~dp1YanMasm\exe\map\ 2>null||(set varError=����%~dp1YanMasm\exe\mapʧ��&goto :sorry)
)

rem ===ע�ỷ������===
echo ע�ỷ������...
echo %path%|find "%~dp0"||set path=%path%;%~dp0
set path
pause

rem ===��ʼ��YanAVM=== 
echo ���ڳ�ʼ�������Ժ�...
if exist %~dp1YanMasm\obj\crf\%~n1.crf (
del /q /f %~dp1YanMasm\obj\crf\%~n1.crf&echo ���ڳ�ʼ��%~n1.crf...
)
if exist %~dp1YanMasm\obj\lst\%~n1.lst (
del /q /f %~dp1YanMasm\obj\lst\%~n1.lst&echo ���ڳ�ʼ��%~n1.lst...
)
if exist %~dp1YanMasm\exe\map\%~n1.map (
del /q /f %~dp1YanMasm\exe\map\%~n1.map&echo ���ڳ�ʼ��%~n1.map...
)
if exist %~dp1YanMasm\exe\%~n1.exe (
del /q /f %~dp1YanMasm\exe\%~n1.exe&echo ���ڳ�ʼ��%~n1.exe...
)

rem ===masm===
echo ����masming...
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

rem ===���гɹ���ʾ===
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
rem ===main��������===

rem ===��ʼ��������ʾ===
:sorry
color f5
title �պ���AVM4.0beta informations
if "%varError%"=="" set varError=δ֪�Ĵ���
echo.&echo.&echo.&echo.
echo      ��������������Щ���� ������     
echo.
echo      ���ź�-_-��sorry��û�ܰ���������
echo.
echo      ����%varError%
echo.
echo      ����ģ����ǵĹ���ʦ�Ѿ����ֽ��������
echo.
echo  --------------------------------------------
echo.
echo          ��Ҫ�˳���ֱ�ӹرմ˴���...
echo.
echo                              �պ���
pause>nul
exit
goto :eof

rem ===���������ʾ===
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
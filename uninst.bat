@echo off 
mode con cols=50 lines=18
title �պ���AVMж��
:main
color 7c
cls
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo       �p        �պ���        �p
echo       �p     QQ:776771343     �p
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo.
echo     ���ź������ܼ���Ϊ������
echo.
echo     ����ÿ�춼��Ŭ����ֻΪ����Ϊ������
echo  ----------------------------------------------  
echo   ע�⣺����ǰ����ж���պ���רɾ...
echo.   
echo   ȷ��ж���밴���س�����������ֱ�ӹرմ˴���...
echo  ------------------------------------------------
pause>nul
set var=%userprofile%

reg delete "HKEY_CLASSES_ROOT\*\shell\�պ���AVM" /f

del /f /q "%var%\����\�պ���AVM.lnk"
del /f /q �պ���AVMʹ��˵��.txt
del /f /q �պ���AVM.exe
del /f /q register.exe
del /f /q CREF.EXE
del /f /q ERROUT.EXE
del /f /q EXEMOD.EXE
del /f /q EXEPACK.EXE
del /f /q LIB.EXE
del /f /q LINK.EXE
del /f /q MAKE.EXE
del /f /q MASM.EXE
del /f /q README.DOC
del /f /q SETENV.EXE

rd /s /q "%var%\����ʼ���˵�\����\�պ���\�պ���AVM"
rd /s /q �պ�������
rd /s /q image
mode con cols=50 lines=12
color 2f
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo       �p      �պ���רɾ      �p
echo       �p     QQ:776771343     �p
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo.
echo   ��ϲ !!! ��ϲ �ɹ�Ϊ��ж��ȫ�����
echo.
echo   ���ĸ�л����ʹ��  ��������˳�����...
echo  ----------------------------------------
echo                           �պ���
echo     ʱ�䣺%time:~0,5%
pause>nul 
set var=
set f_n="%~nx0"
set f_p="%~dp0"
@ping -n 2 127.1 >nul 2>nul
@taskkill /f /im %f_n%
del /f /q %f_p%\%f_n%
cd..
del 



@echo off
echo ����Ϊ��ע���ļ������Ե�...
set var=%~dp0

reg add "HKEY_CLASSES_ROOT\*\shell\�պ���AVM" /ve /d "���͵��պ���AVM (&A)" /f

reg add "HKEY_CLASSES_ROOT\*\shell\�պ���AVM\command" /ve /d "%var%�պ���AVM.exe ""%%1""" /f

set var=




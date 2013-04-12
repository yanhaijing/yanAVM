@echo off
echo 正在为您注册文件，请稍等...
set var=%~dp0

reg add "HKEY_CLASSES_ROOT\*\shell\颜海镜AVM" /ve /d "发送到颜海镜AVM (&A)" /f

reg add "HKEY_CLASSES_ROOT\*\shell\颜海镜AVM\command" /ve /d "%var%颜海镜AVM.exe ""%%1""" /f

set var=




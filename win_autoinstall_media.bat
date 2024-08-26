@echo off

:: Crear directorio temporal para descargar los instaladores
mkdir %TEMP%\software_installers
cd %TEMP%\software_installers

:: Descargar Google Chrome
echo Descargando Google Chrome...
bitsadmin /transfer ChromeDownload https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi %TEMP%\software_installers\googlechrome.msi

:: Descargar Brave
echo Descargando Brave...
bitsadmin /transfer BraveDownload https://laptop-updates.brave.com/latest/win64 %TEMP%\software_installers\brave_installer.exe

:: Descargar VLC
echo Descargando VLC...
bitsadmin /transfer VLCDownload https://get.videolan.org/vlc/last/win64/vlc-3.0.18-win64.exe %TEMP%\software_installers\vlc_installer.exe

:: Descargar WinRAR
echo Descargando WinRAR...
bitsadmin /transfer WinRARDownload https://www.winrar.es/descargas/59/winrar-x64-62b2.exe %TEMP%\software_installers\winrar_installer.exe

:: Instalar Google Chrome
echo Instalando Google Chrome...
msiexec /i %TEMP%\software_installers\googlechrome.msi /qn

:: Instalar Brave
echo Instalando Brave...
%TEMP%\software_installers\brave_installer.exe --silent --install-directory="C:\Program Files\BraveSoftware"

:: Instalar VLC
echo Instalando VLC...
%TEMP%\software_installers\vlc_installer.exe /S

:: Instalar WinRAR
echo Instalando WinRAR...
%TEMP%\software_installers\winrar_installer.exe /S

:: Limpiar los instaladores descargados
echo Limpiando archivos temporales...
rd /s /q %TEMP%\software_installers

echo Instalacion completada.

pause
exit

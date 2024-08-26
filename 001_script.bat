@echo off
echo Instalando Google Chrome, Brave y VLC...

:: Descargar e instalar Google Chrome en español
echo Descargando e instalando Google Chrome...
curl -L -o chrome_installer.exe "https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi"
msiexec /i chrome_installer.exe /qn /norestart

:: Descargar e instalar Brave
echo Descargando e instalando Brave...
curl -L -o brave_installer.exe "https://laptop-updates.brave.com/latest/winx64"
start /wait brave_installer.exe /silent /install

:: Descargar e instalar VLC en español
echo Descargando e instalando VLC...
curl -L -o vlc_installer.exe "https://get.videolan.org/vlc/3.0.18/win64/vlc-3.0.18-win64.exe"
start /wait vlc_installer.exe /L=es /S

echo Instalación completada.

:: Eliminar los instaladores descargados
del chrome_installer.exe
del brave_installer.exe
del vlc_installer.exe

pause

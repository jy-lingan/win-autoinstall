@echo off

:: Descargar e instalar Google Chrome
echo Instalando Google Chrome...
cd %TEMP%
curl -L -o ChromeSetup.exe https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi
msiexec /i ChromeSetup.exe /quiet /norestart
echo Google Chrome instalado.

:: Descargar e instalar Brave Browser
echo Instalando Brave Browser...
curl -L -o BraveSetup.exe https://github.com/brave/brave-browser/releases/download/v1.69.153/BraveBrowserStandaloneSilentSetup.exe
start /wait BraveSetup.exe /silent /noqrcode
echo Brave Browser instalado.

:: Descargar e instalar VLC
echo Instalando VLC...
curl -L -o VLCSetup.exe https://get.videolan.org/vlc/3.0.18/win64/vlc-3.0.18-win64.exe
start /wait VLCSetup.exe /L=es /S
echo VLC instalado.

:: Descargar e instalar WinRAR
echo Instalando WinRAR...
curl -L -o WinRARSetup.exe https://www.rarlab.com/rar/winrar-x64-701es.exe
start /wait WinRARSetup.exe /S
echo WinRAR instalado.

echo Todo el software se ha instalado correctamente.
pause

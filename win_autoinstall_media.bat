@echo off
echo Instalando aplicaciones...

:: Instalar Google Chrome
winget install --id Google.Chrome -l es-ES -e --accept-package-agreements --accept-source-agreements

:: Instalar Brave Browser
winget install --id Brave.Brave -l es-ES -e --accept-package-agreements --accept-source-agreements

:: Instalar VLC Media Player
winget install --id VideoLAN.VLC -l es-ES -e --accept-package-agreements --accept-source-agreements

:: Instalar WinRAR
winget install --id RARLab.WinRAR -l es-ES -e --accept-package-agreements --accept-source-agreements

echo Instalacion completada.
pause

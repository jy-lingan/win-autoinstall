@echo off
echo Instalando Office Profesional Plus 2021 en español...

:: Descargar la imagen de Office Pro Plus 2021
echo Descargando Office Pro Plus 2021...
curl -L -o "ProPlus2021Retail.img" "https://officecdn.microsoft.com/db/492350F6-3A01-4F97-B9C0-C7C6DDF67D60/media/es-ES/ProPlus2021Retail.img"

:: Montar la imagen usando PowerShell
echo Montando la imagen de Office...
PowerShell -Command "Mount-DiskImage -ImagePath 'ProPlus2021Retail.img'"

:: Esperar a que la imagen se monte (puede tardar unos segundos)
timeout /t 5 /nobreak > nul

:: Obtener la letra de la unidad donde se montó la imagen
for /f "tokens=2 delims==" %%I in ('PowerShell -Command "(Get-DiskImage -ImagePath 'ProPlus2021Retail.img' | Get-Volume).DriveLetter"') do set driveLetter=%%I

:: Crear archivo configuration.xml
echo Creando archivo de configuración...
echo ^<Configuration^> > configuration.xml
echo   ^<Add OfficeClientEdition="64" Channel="PerpetualVL2021" SourcePath="%driveLetter%:\"^> >> configuration.xml
echo     ^<Product ID="ProPlus2021Retail"^> >> configuration.xml
echo       ^<Language ID="es-es" / ^> >> configuration.xml
echo     ^</Product^> >> configuration.xml
echo   ^</Add^> >> configuration.xml
echo   ^<Display Level="None" AcceptEULA="TRUE" / ^> >> configuration.xml
echo ^</Configuration^> >> configuration.xml

:: Ejecutar la instalación de Office
echo Instalando Office Pro Plus 2021...
%driveLetter%:\setup.exe /configure configuration.xml

:: Desmontar la imagen después de la instalación
PowerShell -Command "Dismount-DiskImage -ImagePath 'ProPlus2021Retail.img'"

:: Limpiar archivos temporales
echo Limpiando archivos temporales...
del "ProPlus2021Retail.img"
del "configuration.xml"

echo Instalación completada.
pause
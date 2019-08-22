@echo off
set pathCopy=%~dp0
set date=%date:/=%
set hora=%time:~0,2%
if "%hora:~0,1%" == " " set hora=0%hora:~1,1%

set min=%time:~3,2%
for %%I in (.) do set cliente=%%~nxI
set pathDest=C:\backup\%cliente%\%date%_%hora%_%min%

mkdir %pathDest%
dir %pathCopy%\*.* > %pathDest%\_antes_bkp_%date%_%hora%_%min%_%username%.txt

echo Sera efetuado backup de [%pathCopy%] para [%pathDest%]
echo.
choice /m "Isto esta correto? [s/n]" /c sn /n
if %errorlevel% == 2 (
  echo Processo cancelado. 
) else (
   robocopy %pathCopy% %pathDest%
   echo Backup efetuado em %pathDest%
)

dir %pathCopy%\*.* > %pathDest%\_depois_bkp_%date%_%hora%_%min%_%username%.txt

echo .

fc %pathDest%\_antes_bkp_%date%_%hora%_%min%_%username%.txt %pathDest%\_depois_bkp_%date%_%hora%_%min%_%username%.txt

pause


title Create bakup

set "filename=%~dp0"
For %%A in ("%filename%") do (
    set time=%%~tA
    echo Backup datetime: %%~tA
) >> "..\0_Pasta\DadosCliente\BackupLog%client%.txt"

for /f "tokens=1,2 delims= " %%a in ("%time%") do (
  set data=%%a
  set hora=%%b
) 

for /f "tokens=1,2,3 delims=/" %%a in ("%data%") do (
  set day=%%a
  set month=%%b
  set year=%%c
) 

for /f "tokens=1,2 delims=:" %%a in ("%hora%") do (
  set HH=%%a
  set MM=%%b
) 

for %%a in ("%~dp0..\.") do set "client=%%~nxa"

set "backupName=%year%%month%%day%_%HH%%MM%"
echo Nome da pasta backup: %backupName% >> "..\0_Pasta\DadosCliente\BackupLog%client%.txt"

set "source=C:\ERP\%client%"
set "destiny=C:\Backup\%client%\%backupName%"
echo Source: %source% >> "..\0_Pasta\DadosCliente\BackupLog%client%.txt"
echo Destiny: %destiny%>> "..\0_Pasta\DadosCliente\BackupLog%client%.txt"
echo. >> "..\0_Pasta\DadosCliente\BackupLog%client%.txt"
robocopy "%source%" "%destiny%" *.*

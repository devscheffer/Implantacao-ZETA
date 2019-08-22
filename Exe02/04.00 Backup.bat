title Create bakup

set "filename=%~dp0"
For %%A in ("%filename%") do (
    set time=%%~tA
    echo Backup datetime: %%~tA
) >> text.txt

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

set "backupName=%year%%month%%day%_%HH%%MM%"
echo %backupName% >> C:\Backup\%client%\BackupLog.txt
echo %backupName% >> C:\Backup\%client%\text.txt

for %%a in ("%~dp0..\..\.") do set "client=%%~nxa"

set "source=C:\ERP\%client%"
set "destiny=C:\Backup\%client%\%backupName%"
echo source: %source% >> text.txt
echo destiny: %destiny%>> text.txt
robocopy "%source%" "%destiny%" *.*

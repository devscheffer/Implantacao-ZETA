title Install ZETA

REM Cria a 0_Pasta, nela devem ser colocado os arquivos do cliente de acordo com o manual
set "pathback=%~dp0"

cd "%pathback%..\0_Pasta\LIC\Integro"
start /w "" "Zeta.exe"

cd "%pathback%\Exe03"

call "06.01 Move TP_.bat"
call "06.02 Rename tps.bat"
call "06.03 Move Raiz tps.bat"
call "06.04 Create Pastas ZETA.bat"

cd "%pathback%..\"
start /w "" "Zeta.exe"

cd "%pathback%"
pause
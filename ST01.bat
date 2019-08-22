title Install ZETA

REM Cria a 0_Pasta, nela devem ser colocado os arquivos do cliente de acordo com o manual
cd "%~dp0\Exe01"
start /w "" "01.01 Create 0_Pasta.bat"
start /w "" "01.02 Copy BaseFile.bat"
cd "%~dp0"

REM Executa os batch file necessarios para a primeira execucao do ZETA
set "pathback=%~dp0"
cd "%~dp0\Exe02"

call "02.01 Copy Integro.bat"
call "02.02 Del Integro.bat"
call "02.03 Copy Limpo.bat"
call "02.04 Del Limpo.bat"
call "02.05 Copy Raiz ZETA.bat"
call "03.01 Copy License.bat"
call "03.02 Create Password File.bat"

cd "%pathback%..\0_Pasta\DadosCliente\"
start "" "ClientPassword.txt" 
cd "%pathback%\Exe02"

call "03.03 Rename License.bat"
call "03.04 Move Conv01.bat"
call "03.05 Execute Conv01.bat"
call "03.06 Move Conv02.bat"
call "03.07 Execute Conv01.bat"
call "03.08 Move LIC.bat"
call "03.09 Copy Raiz License.bat"
call "03.10 Copy Raiz Parameters.bat"

cd "%pathback%"
call "Backup.bat"
cd "%pathback%\Exe02"

call "05.00 Execute ZETA.bat"

cd "%pathback%"
pause
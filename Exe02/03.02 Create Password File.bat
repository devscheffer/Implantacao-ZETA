title Create arquivo senha com os dados do cliente

set "filename=%~dp0..\..\0_Pasta\LIC\*ZWLIC.tps"
For %%A in ("%filename%") do (set Nome=%%~nxA)
echo Licenca: %Nome% >> "%~dp0..\..\0_Pasta\DadosCliente\ClientPassword.txt"

for /f "tokens=1,2,3 delims=_" %%a in ("%Nome%") do (set Empresa=%%a&set Serial=%%b&set Arquivo=%%c)
echo.Empresa: %Empresa%  >> "%~dp0..\..\0_Pasta\DadosCliente\ClientPassword.txt"
echo.Serial : %Serial% >> "%~dp0..\..\0_Pasta\DadosCliente\ClientPassword.txt"
echo.Arquivo: %Arquivo% >> "%~dp0..\..\0_Pasta\DadosCliente\ClientPassword.txt"
echo.Senha  : ZETACW15%Serial%>> "%~dp0..\..\0_Pasta\DadosCliente\ClientPassword.txt"

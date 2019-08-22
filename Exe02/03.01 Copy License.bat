title Copia arquivo de Licenca para a pasta LIC


robocopy "%~dp0..\BaseFile\DadosCliente" "%~dp0..\..\0_Pasta\DadosCliente\Licenca" *.tps

robocopy "%~dp0..\BaseFile\DadosCliente" "%~dp0..\..\0_Pasta\DadosCliente" /e /copyall

del "%~dp0..\..\0_Pasta\DadosCliente\*.tps" 

robocopy "%~dp0..\..\0_Pasta\DadosCliente\Licenca" "%~dp0..\..\0_Pasta\LIC" *.tps

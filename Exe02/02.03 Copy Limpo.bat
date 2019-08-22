title Copia os arquivos do Integro para o Limpo
REM Copia todosos arquivos, pastas e estruturado Integro depois de limpdo

robocopy "%~dp0..\..\0_Pasta\LIC\Integro" "%~dp0..\..\0_Pasta\LIC\Limpo" /e /copyall

title Copia arquivo do SistemaBase para o Integro
REM Copia todos os arquivos, pastas e estrutura do SistemaBase para o Integro

robocopy "%~dp0..\..\0_Pasta\SistemaBase" "%~dp0..\..\0_Pasta\LIC\Integro" /e /copyall


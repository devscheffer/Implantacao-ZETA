title Copy BaseFile
REM Copy os arquivos do BaseFile para suas respectivas pastas no 0_Pasta

REM Copy BaseFile Conv01
robocopy "%~dp0..\BaseFile\Conversores01" "%~dp0..\..\0_Pasta\LIC\Conversores\Conversores01" /e /copyall

REM Copy BaseFile Conv02
robocopy "%~dp0..\BaseFile\Conversores02" "%~dp0..\..\0_Pasta\LIC\Conversores\Conversores02" /e /copyall

REM Copy BaseFile SistemaBase
robocopy "%~dp0..\BaseFile\SistemaBase" "%~dp0..\..\0_Pasta\SistemaBase" /e /copyall

REM Copy BaseFile Parametros
robocopy "%~dp0..\BaseFile\Parametros" "%~dp0..\..\0_Pasta\LIC\Parametros" /e /copyall

echo Copias criadas com sucesso

exit
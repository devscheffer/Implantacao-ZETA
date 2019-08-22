title Cria 0_Pastas
REM Cria todas as pastas da 0_Pasta
FOR %%A IN (
  "..\..\0_Pasta\DadosCliente\Licenca\"
  ,"..\..\0_Pasta\LIC\Conversores\Conversores01\"
  ,"..\..\0_Pasta\LIC\Conversores\Conversores02\"
  ,"..\..\0_Pasta\LIC\Integro\"
  ,"..\..\0_Pasta\LIC\Limpo\"
  ,"..\..\0_Pasta\LIC\Parametros\"
  ,"..\..\0_Pasta\LIC\TP_\"
  ,"..\..\0_Pasta\SistemaBase\"
  ) DO (mkdir %%A)

echo Pastas criadas com sucesso

exit
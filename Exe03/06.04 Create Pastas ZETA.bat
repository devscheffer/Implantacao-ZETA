title Cria 0_Pastas
REM Cria todas as pastas da 0_Pasta

cd "%pathback%..\"
FOR %%A IN (
  "Downloads"
  ,"Fotos"
  ,"Fotos_Funcionarios"
  ,"Integrador"
  ,"LOGS"
  ,"Media\Fornecimento"
  ,"OrcImportados\AudatexImportados"
  ,"OrcImportados\AudatexImportadosHTML"
  ,"OrcImportados\CiliaImportados"
  ,"OrcImportados\OrionImportados"
  ,"OrcImportados\SomaImportados"
  ,"Orcamentos"
  ,"Temp"
  ,"Uploads"
  ,"ZetaFoto"
  ,"template_email"
  ,"xml_importados"
  ,"xml_notas"
  ) DO (mkdir %%A)

echo Pastas criadas com sucesso

exit
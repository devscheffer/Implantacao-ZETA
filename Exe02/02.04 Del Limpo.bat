title Clean Limpo
REM Remove os arquivos do Limpo

set "pathback=%~dp0..\"
cd "%pathback%..\0_Pasta\LIC\Limpo"

del *.env
del *.jpg
del *.jpeg
del *.pdf
del *.scn
del *.tcf
del *.tp_
del *.tpe
del *.tpn
del *.tps
del *.txt
del *.xml
del log_caixa_financeiro.*
del log_vendas.*
del zezmessa.*
del zwlog.*

cd "%pathback%\Exe02" 

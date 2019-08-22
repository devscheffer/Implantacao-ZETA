echo off
echo.
echo.
echo.
echo    v1.1.0
echo.
net session >nul 2>&1
if not %errorLevel% == 0 (
    echo.
    echo.
    echo ERRO: O usuario atual nao possui permissoes de administrador
    goto :exit
)
:configuration
set nome_servico=execute_zeta
echo.
:custom_name
choice /m "1. O servico tem um nome customizado (diferente de %nome_servico%) ? [s/n]" /c sn /n
if %errorlevel% == 1 (
  :custom_name
  echo.
  set /p nome_servico="Qual o nome do servico? "
)
sc query %nome_servico% | findstr "1060" > nul 2>&1
if %errorlevel% == 0 (
  echo.
  echo.
  echo ERRO: Nao existe um servico com o nome %nome_servico%, o processo de remocao sera abortado.
  goto :custom_name
)
sc query %nome_servico% | findstr /i "RUNNING" > nul 2>&1
if %errorlevel% == 0 (
  sc stop %nome_servico% >nul 2>&1
  if not %errorlevel% == 0 (
     echo.
     echo.
     echo ERRO: Nao foi possivel parar o servico.
     goto :exit
  )
) 
sc delete %nome_servico% >nul 2>&1
if not %errorlevel% == 0 (
  echo.
  echo.
  echo ERRO: Nao foi possivel remover o servico.
  goto :exit
)
echo.
echo.
echo INFO: O servico %nome_servico% foi removido com exito.
:exit
echo.
echo.
pause

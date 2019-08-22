echo off
echo    INSTALADOR SERVICO WINDOWS
echo    v1.0.0.
echo.
set local=%~dp0
set zetaexecute=%local%ZetaExecute.exe
set srvany=%local%\srvany.exe
set nome_servico=execute_zeta
set filial=1
set user=0
set senha=null
set timeout=60
set emailendereco=zeta.monitor.servicos@gmail.com
set emailenderecocopia=null
echo.
net session >nul 2>&1
if not %errorLevel% == 0 (
    echo ERRO: O usuario atual nao possui permissoes de administrador.	
    pause			
    goto :exit
)

if not exist %zetaexecute% (
  echo ERRO: e necessario possuir o executavel ZetaExecute.exe porem nao foi encontrado em %local%.
  pause
  goto :exit
)

if not exist %srvany% (
  echo.
  echo.
  echo ERRO: O utilitario srvany.exe nao foi encontrado em %local%.
  pause	
  goto :exit
)

:configuration
echo ************ Configuracao ****************
choice /m "1. Deseja customizar o nome do servico [%nome_servico%]? [s/n]" /c sn /n
if %errorlevel% == 1 (
  :custom_name
  set nome_servico=''
  set /p nome_servico="Que nome voce gostaria de usar? "
)
if %nome_servico% == '' (
  echo.
  echo.
  echo INFO: O nome do servico nao foi definido, escolha outro nome.
  echo.
  goto :custom_name
)
sc query %nome_servico% | findstr "1060" > nul 2>&1
if not %errorlevel% == 0 (
  echo.
  echo.
  echo INFO: Ja existe um servico com o nome %nome_servico%, escolha outro nome.
  echo.
  goto :custom_name
)
echo.


choice /m "2. O sistema utiliza filiais? [s/n]" /c sn /n
if %errorlevel% == 1 (
  :custom_filial
  set /p filial="Sera executado para qual filial? (insira o codigo da filial)"
)
if %filial% == '' (
  echo.
  echo INFO: A filial não foi definida. Defina uma filial.
  echo.
  goto :custom_filial
)
echo.

choice /m "3. O servico sera executado por um usuario diferente de [%user%]? [s/n]" /c sn /n
if %errorlevel% == 1 (
  :custom_user
  set /p user="Sera executado por qual usuario? (insira o nome do usuario)"	
)
if %user% == '' (
  echo.
  echo INFO: Usuario não foi definido. Defina um usuario.
  goto :custom_user
)
set /p senha="Digite a senha do usuario: "
if %senha% == '' (
  set senha=null
)
echo.

choice /m "4. O timeout determindo e de %timeout% segundos. Deseja modificar esse valor? [s/n]" /c sn /n
if %errorlevel% == 1  (
  set /p timeout="Novo valor de timeout? (insira timeout em segundos)"	
)
echo.

choice /m "5. Deseja receber copia de mensagem por e-mail quando o processo travar? [s/n]" /c sn /n
if %errorlevel% == 1  (
  set /p emailenderecocopia="Qual o endereco de e-mail para copia? (insira seu e-mail)"	
)
echo.
echo ************ Configuracao Efetuada ****************
echo.
echo INFO: O nome do servico sera: %nome_servico%.
echo INFO: O servico sera executado em: "%local%"
echo.INFO: A filial utilizada sera: %filial%
echo.INFO: Sera executado pelo usuario: %user%
echo.INFO: Timeout: %timeout%
echo.INFO: Destinatario e-mail com mensagem de travamento: %emailendereco%
echo.INFO: Destinatario copia e-mail com mensagem de travamento: %emailenderecocopia%
echo.
echo.

choice /m "6. Isto esta correto? [s/n]" /c sn /n
if %errorlevel% == 2 (
  echo.
  echo.
  echo.
  echo.
  goto :configuration
)
echo ************ Aguarde enquando criamos o novo servico ****************
echo . . .
sc create %nome_servico% binPath= "%srvany%" DisplayName= "%nome_servico%" start= auto > nul 2>&1
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\%nome_servico%\Parameters /v AppDirectory /t REG_SZ /d %local% >nul 2>&1
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\%nome_servico%\Parameters /v Application /t REG_SZ /d %zetaexecute% >nul 2>&1
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\%nome_servico%\Parameters /v AppParameters /t REG_SZ /d " %nome_servico% %filial% %user% %senha% %timeout% %emailendereco% %emailenderecocopia% " >nul 2>&1
echo INFO: Iniciando o servico. . .
sc start %nome_servico% > nul 2>&1
echo ERRO AO INICIAR SERVICO? %errorlevel% 
if %errorlevel% == 1 (
  echo.
  echo.
  echo ERRO: Houve um erro ao iniciar o servico.
  goto :exit
)

 
echo INFO: O servico foi criado e iniciado com sucesso.
echo.
echo.
pause

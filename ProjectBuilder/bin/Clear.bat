@ECHO OFF
set PATH_BUILDER=%~1
set PROCESSO=CLEAR
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 0
cd %PATH_BUILDER%\log
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Executando clear da pasta \log" 3
erase /q/s *.* >> %PATH_BUILDER%\log\%PROCESSO%.log 2>&1
cd %PATH_BUILDER%\tmp
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Executando clear da pasta \tmp" 3
erase /q/s *.* >> %PATH_BUILDER%\log\%PROCESSO%.log 2>&1
cd %PATH_BUILDER%\entrega
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Executando clear da pasta \entrega" 3
erase /q/s *.* >> %PATH_BUILDER%\log\%PROCESSO%.log 2>&1
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Executado com sucesso" 4

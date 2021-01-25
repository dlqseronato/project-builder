@ECHO OFF
set PATH_BUILDER=%1
SET PROCESSO=MOVE_ASSETS
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%x
       )
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 0
##cd %JV_CAMINHO%%JV_WEB%
##erase /q/f *.*
##RMDIR /Q/S "assets" >> %PATH_BUILDER%\log\%PROCESSO%.log 2>&1
cd %UI_CAMINHO%%UI_DASHBOARD%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Move Assets - Iniciando" 3
SET /a INDEX = 1
:WHILE
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Move Assets - Tentativa %INDEX%" 3
	xcopy /E/H/C/I/Y/F %UI_CAMINHO%%UI_DASHBOARD%\assets\i18n\* %JV_CAMINHO%%JV_WEB%\assets\i18n >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1
	xcopy /y/f/c %UI_CAMINHO%%UI_DASHBOARD%\assets\* %JV_CAMINHO%%JV_WEB%\assets >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1
	xcopy /y/f/c %UI_CAMINHO%%UI_DASHBOARD%\* %JV_CAMINHO%%JV_WEB% >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 30
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Acesso negado" 21
	ECHO ERRORLEVEL=%ERRORLEVEL%
	IF %ERRORLEVEL% EQU 0 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Move Assets - Finalizado com sucesso" 2
		EXIT /B 0
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Move Assets -  Falhou: %ERRORLEVEL%" 1
	)
:ENDWHILE
	IF %INDEX% LEQ 3 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 5
		SET /a INDEX = INDEX + 1  
		CALL :WHILE
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Move Assets - Cancelado. Falha 3 vezes consecutivas." 1
		EXIT /B 1
	)
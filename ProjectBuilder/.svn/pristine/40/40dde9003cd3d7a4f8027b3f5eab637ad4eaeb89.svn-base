@ECHO OFF
set PATH_BUILDER=%1
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%x
       )
cd %UI_CAMINHO%
set LOG_ERROR=
set LOG_SUCESS=
SET PROCESSO=ANGULAR_BUILD_PROD
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 0
SET /a INDEX = 1
:WHILE
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Iniciando tentativa de build numero %INDEX%" 3
	call cmd /c "npm run ng build -prod >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1"
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 30
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "%RETORNO_BUILD%" 3
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Failed" 21
	ECHO ERRORLEVEL=%ERRORLEVEL%
	IF %ERRORLEVEL% EQU 0 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Build realizado com sucesso" 2
		EXIT /B 0
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Build falhou: %LOG_ERROR%" 1
	)
:ENDWHILE
	IF %INDEX% LEQ 3 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 5
		SET /a INDEX = INDEX + 1  
		CALL :WHILE
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Cancelado. %PROCESSO% Falhou 3 vezes consecutivas." 1
		EXIT /B 1
	)
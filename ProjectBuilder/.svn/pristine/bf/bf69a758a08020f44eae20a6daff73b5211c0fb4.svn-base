@ECHO OFF
set PATH_BUILDER=%~1
set TELA=%~2
set PROCESSO=ANGULAR_BUILD
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%~x
       )
cd %UI_CAMINHO%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "" 0
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Removendo arquivos dist\%TELA%" 3
RMDIR /Q/S "dist\%TELA%" >> %PATH_BUILDER%\log\%TELA%.log 2>&1
set LOG_ERROR=
SET /a INDEX = 1
:WHILE
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Inicio tentativa de build numero %INDEX%" 3
	call cmd /c "npm run ng build %TELA% >> %PATH_BUILDER%\tmp\%TELA%.tmp 2>&1"
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "" 30
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Failed" 21
	ECHO ERRORLEVEL=%ERRORLEVEL%
	IF %ERRORLEVEL% EQU 0 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Build realizado com sucesso" 2
		EXIT /B 0
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Build %INDEX% falhou!" 1
	)
:ENDWHILE
	IF %INDEX% LEQ 3 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "" 5
		SET /a INDEX = INDEX + 1  
		CALL :WHILE
	) ELSE (
		call %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Cancelado. %PROCESSO% falhou 3 vezes consecutivas." 1
		EXIT /B 1
	)

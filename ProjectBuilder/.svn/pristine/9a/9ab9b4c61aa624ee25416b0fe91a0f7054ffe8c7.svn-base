@ECHO OFF
set PATH_BUILDER=%1
SET PROCESSO=GERA_PACOTE
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%x
       )	   
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 0
SET /a INDEX = 1
:WHILE
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Inicio tentativa de copia numero %INDEX%" 3
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Copia Assets para %PATH_BUILDER%\entrega" 3
	xcopy /Q/Y/E/H/C/I %UI_CAMINHO%%UI_DASHBOARD%"\assets\*" %PATH_BUILDER%"\entrega\assets" >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Copia EAR para %PATH_BUILDER%\entrega" 3
	xcopy /q/c/f/y %JV_CAMINHO%%JV_DIST%"\*.ear" %PATH_BUILDER%"\entrega" >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "" 30
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Failed" 21
	ECHO ERRORLEVEL=%ERRORLEVEL%
	IF %ERRORLEVEL% EQU 0 (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Copia realizada com sucesso" 2
		EXIT /B 0
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Copia %INDEX% falhou!" 1
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


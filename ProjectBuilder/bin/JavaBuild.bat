@ECHO OFF
set PATH_BUILDER=%~1
set PROCESSO=JAVA_BUILD
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%~x
       )
set COMPILE_ANT=-Dbrowser.context=%JV_CAMINHO%	   
set ERRO="N"
cd %ANT_PATH%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 0
SET /a INDEX = 1
:WHILE
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Iniciando tentativa de build: %INDEX%" 3
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Iniciando Clean" 3
	call cmd /c "ant -f %JV_CAMINHO% %COMPILE_ANT% clean >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1" 
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "Iniciando Dist" 3
	call cmd /c "ant -f %JV_CAMINHO% %COMPILE_ANT% dist >> %PATH_BUILDER%\tmp\%PROCESSO%.tmp 2>&1"
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "" 30
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "failed" 21
	IF %ERRORLEVEL% NEQ 0 (
		SET ERRO="S"
	)
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "comando interno" 21
	IF %ERRORLEVEL% NEQ 0 (
		SET ERRO="S"
	)
	IF %ERRO% EQU "N" (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Build realizado com sucesso" 2
		EXIT /B 0
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Build %INDEX% falhou!" 1
	)
:ENDWHILE
	IF %INDEX% LEQ 3 (
		SET /a INDEX = INDEX + 1  
		CALL :WHILE
	) ELSE (
		call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESSO% "%PROCESSO% - Cancelado! Falha 3 vezes consecutivas." 1
		EXIT /B 1
	)

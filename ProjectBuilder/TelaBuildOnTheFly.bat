@ECHO OFF
set PATH_BUILDER=%CD%
set BUILD_PROD_STATUS=
set BUILD_ANT_STATUS=
set PROCESS=BUILDER
chcp 65001
call cmd /c %PATH_BUILDER%\bin\Clear %PATH_BUILDER% %PROCESS%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "" 0
for /f "tokens=1* delims=;" %%x in (      
        'type %PATH_BUILDER%\config\config.properties'
       ) do (
			SET %%x
       ) 
cd %UI_CAMINHO%\projects
IF NOT DEFINED COMPILAR_TELA (
	for /f "tokens=1* delims=" %%y in (
		'dir /b /a:d'
		) do (
			CALL :COMPILA_TELA %%y
		)
) ELSE (
	CALL :COMPILA_TELA %COMPILAR_TELA%
)



:COMPILA_TELA
SET TELA=%1
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando AngularBuild %TELA%" 3
			call cmd /c %PATH_BUILDER%\bin\AngularBuild %PATH_BUILDER% %TELA%
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Cancelado." 21
			IF %ERRORLEVEL% EQU 0 (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "AngularBuild %TELA% REALIZADO COM SUCESSO" 2
			) ELSE (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "AngularBuild %TELA% FALHOU: %ERRORLEVEL%" 1
				PAUSE
				EXIT 1
			)
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando MoveBundlesOnTheFly %TELA%" 3
			call cmd /c %PATH_BUILDER%\bin\MoveBundlesOnTheFly %PATH_BUILDER% %TELA%
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Cancelado." 21
			IF %ERRORLEVEL% EQU 0 (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveBundlesOnTheFly %TELA% REALIZADO COM SUCESSO" 2
			) ELSE (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveBundlesOnTheFly %TELA% FALHOU: %ERRORLEVEL%" 1
				PAUSE
				EXIT 1
			)

PAUSE
EXIT 0	
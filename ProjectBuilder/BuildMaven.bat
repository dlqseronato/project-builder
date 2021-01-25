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

:COMPILA_ANGULAR_PROD
cd %UI_CAMINHO%   
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando AngularBuildProd" 3
call cmd /c %PATH_BUILDER%\bin\AngularBuildProd %PATH_BUILDER%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% ANGULAR_BUILD_PROD "Cancelado." 21
IF %ERRORLEVEL% EQU 0 (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "AngularBuildProd REALIZADO COM SUCESSO" 2
) ELSE (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "BUILDER FALHOU: %ERRORLEVEL%" 1
	PAUSE
	EXIT 1
)
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando MoveAssets" 3
call cmd /c %PATH_BUILDER%\bin\MoveAssetsMaven %PATH_BUILDER%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% MOVE_ASSETS "Cancelado." 21
IF %ERRORLEVEL% EQU 0 (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveAssets REALIZADO COM SUCESSO" 2
) ELSE (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveAssets FALHOU: %ERRORLEVEL%" 1
	PAUSE
	EXIT 1
)
cd %ANT_PATH%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando JavaBuild" 3
call cmd /c %PATH_BUILDER%\bin\MavenJavaBuild %PATH_BUILDER%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% JAVA_BUILD "Cancelado." 21
IF %ERRORLEVEL% EQU 0 (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "JavaBuild REALIZADO COM SUCESSO" 2
) ELSE (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "JavaBuild FALHOU: %ERRORLEVEL%" 1
	PAUSE
	EXIT 1
)
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando GeraPacote" 3
call cmd /c %PATH_BUILDER%\bin\GeraPacoteMaven %PATH_BUILDER%
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% GERA_PACOTE "Cancelado." 21
IF %ERRORLEVEL% EQU 0 (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "GeraPacote REALIZADO COM SUCESSO" 2
) ELSE (
	call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "GeraPacote FALHOU: %ERRORLEVEL%" 1
	PAUSE
	EXIT 1
)
call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "" 4
pause
exit 0

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
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "Iniciando MoveBundles %TELA%" 3
			call cmd /c %PATH_BUILDER%\bin\MoveBundles %PATH_BUILDER% %TELA%
			call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %TELA% "Cancelado." 21
			IF %ERRORLEVEL% EQU 0 (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveBundles %TELA% REALIZADO COM SUCESSO" 2
			) ELSE (
				call cmd /c %PATH_BUILDER%\bin\Logger %PATH_BUILDER% %PROCESS% "MoveBundles %TELA% FALHOU: %ERRORLEVEL%" 1
				PAUSE
				EXIT 1
			)

	
@echo off

setlocal enabledelayedexpansion

set Nb_arg=0
for %%a in (%*) do (
    set /a Nb_arg += 1
)

if "%~1"=="" ( REM vérifie d'un nom est passé en argument
    echo Erreur syntaxe attendu : %0 [NomDuFichier.extention]
    exit /b 1
) else if %Nb_arg% gtr 1 (
    echo Erreur : Il y a trop d'arguments.
    echo Syntaxe attendue : %0 [NomDuFichier.extension]
    exit /b 1
) else if "%~x1"=="" (  REM vérifie l'extention du fichier
    echo Erreur syntaxe : %0 [NomDuFichier.extention]
    exit /b 1
) else (
    if not exist %1 (
        type nul > %1
    )
    start notepad %1
    exit /b 0
)


endlocal

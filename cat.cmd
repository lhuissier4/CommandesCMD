@echo off

setlocal enabledelayedexpansion

set Nb_arg=0
for %%a in (%*) do (
    set /a Nb_arg += 1
)
set "chemin_dacces=%cd%"

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
        echo Erreur le fichier n'existe pas
        exit /b 1
    )

REM ajouter le scripte pour separer le nom du fichier du chemin d'acces
    cd chemin_dacces=%cd%
    type "%1"
    exit /b 0
endlocal
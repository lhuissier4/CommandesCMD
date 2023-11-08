@echo off


setlocal enabledelayedexpansion

:: Initialisation du nombre d'arguments
set "Nb_arg=0"

:: Compter le nombre d'arguments
for %%a in (%*) do (
    set /a Nb_arg += 1
)

:: Définition du chemin d'accès initial (répertoire actuel)
set "chemin_dacces=%cd%"

:: Vérification des arguments
if %Nb_arg% gtr 0 (
    if exist "%~1" (
        set "chemin_dacces=%~1"
    ) else (
        echo Le chemin d'acces specifie n'existe pas.
        exit /b 1
    )
)


dir "%chemin_dacces%" | more +4 

:: Fin du script
endlocal

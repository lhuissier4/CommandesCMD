@echo off

setlocal enabledelayedexpansion
set existeDeja=0
set Nb_arg=0

for %%a in (%*) do (
    set /a Nb_arg += 1
)

if "%~1"=="" (
    echo Erreur syntaxe attendue : %0 [NomDuFichier.extention]
    exit /b 1
) else if %Nb_arg% gtr 1 (
    echo Erreur : Il y a trop d'arguments.
    echo Syntaxe attendue : %0 [NomDuFichier.extension]
    exit /b 1
) else if "%~x1"=="" (
    echo Erreur syntaxe : %0 [NomDuFichier.extention]
    exit /b 1
) else (
    if not exist %1 (
        type nul > %1
        set /a existeDeja+=1
    )
    start notepad %1
    
    :WaitForNotepadToClose
    tasklist | find /i "notepad.exe" >nul
    if errorlevel 1 (
        if !existeDeja! equ 1 (
            for %%i in ("%1") do (
                if %%~zi equ 0 (
                    Del "%%i"
                )
            )
        )
        exit /b 0
    ) else (
        timeout /t 5 /nobreak >nul
        goto :WaitForNotepadToClose
    )
)

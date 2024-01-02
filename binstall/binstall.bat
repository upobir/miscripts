@echo off
setlocal

if "%~1"=="" (
    echo Usage: %0 source_file
    echo.
    echo Copies source_file to the directory of this script.
    exit /b 1
)

set "source_file=%~1"
set "script_dir=%~dp0"

copy "%source_file%" "%script_dir%"

exit /b 0

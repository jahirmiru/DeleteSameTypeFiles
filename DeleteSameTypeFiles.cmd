@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Anchor to the folder where this script resides
set "ROOT=%~dp0"

echo Target folder:
echo %ROOT%
echo.

set /p "PAT=Enter file pattern to delete (e.g. *.tmp): "
if "%PAT%"=="" (
echo No pattern entered. Exiting.
pause
goto :eof
)

echo.
echo You are about to delete all files matching "%PAT%" under:
echo %ROOT%
choice /m "Proceed"
if errorlevel 2 (
echo Cancelled.
pause
goto :eof
)

echo Deleting files...
set /a COUNT=0
for /R "%ROOT%" %%F in (%PAT%) do (
if exist "%%F" (
echo Deleting: %%F
del /q "%%F"
set /a COUNT+=1
)
)

echo.
echo Done. Deleted !COUNT! file(s).
echo.
echo Press any key to close...

pause >nul

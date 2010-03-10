@ECHO OFF
REM
REM Created by Petr Kunilov
REM SCRIPT deletes unnecessary files from pointed directories
REM UNN VMK 2010
REM
@ECHO ON

set FOLDERS=
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\bin
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\obj 
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\ZipLib\bin 
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\ZipLib\ZipLib\bin 
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\ZipLib\ZipLib\obj

for /d %%f in (%FOLDERS%) do (
    if exist "%%f" (rd /Q /S "%%f")
)
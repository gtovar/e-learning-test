@ECHO OFF
REM
REM Created by Petr Kunilov
REM SCRIPT deletes unnecessary files from pointed directories
REM UNN VMK 2010
REM
@ECHO ON

set FOLDERS=
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\ZipLib
set FOLDERS=%FOLDERS% TestGenerator\WordToScorm\ZipLib\ZipLib
set FOLDERS=%FOLDERS% VmkLearningKit\QWord
set FOLDERS=%FOLDERS% VmkLearningKit\VmkLearningKit
set FOLDERS=%FOLDERS% ULK\UnnLearningKitLibrary

for /d %%f in (%FOLDERS%) do (
    if exist "%%f\bin" (rd /Q /S "%%f\bin")
    if exist "%%f\obj" (rd /Q /S "%%f\obj")
)
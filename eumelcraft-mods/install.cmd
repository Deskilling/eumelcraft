@echo off

:: Define the source directory (from which to copy files)
set SOURCE_DIR=EumelcraftMods

:: Define the target directory (Minecraft folder)
set TARGET_DIR=%appdata%\.minecraft

:: Check if the source directory is provided and exists
if "%SOURCE_DIR%"=="" (
    echo Please provide a source directory.
    exit /b 1
)

if not exist "%SOURCE_DIR%" (
    echo Source directory "%SOURCE_DIR%" does not exist.
    exit /b 1
)

:: Check if the target directory exists
if not exist "%TARGET_DIR%" (
    echo Target directory "%TARGET_DIR%" does not exist.
    exit /b 1
)

:: Delete the mods folder if it exists in the target directory
if exist "%TARGET_DIR%\mods" (
    echo Deleting "%TARGET_DIR%\mods" folder...
    rmdir /s /q "%TARGET_DIR%\mods"
)

:: Copy all files and folders from the source directory to the target directory
echo Copying content from "%SOURCE_DIR%" to "%TARGET_DIR%"...
xcopy "%SOURCE_DIR%\*" "%TARGET_DIR%" /e /h /y /q

:: Inform the user of completion
echo Copy operation complete.
pause
exit /b 0
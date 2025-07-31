@ECHO OFF
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script is designed to automathe the MKLINK command in Windows.                                                              ::
:: Ensure you run this script with administrative privileges.                                                                       ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: The script will prompt for the taget path and link path.                                                                         ::
:: It will handle errors and provide feedback on the success or failure of the operation.                                           ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: Note: This script uses the MKLINK command, which requires administrative privileges.                                             ::
:: Ensure you have the necessary permissions to use the MKLINK command on your system.                                              ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: For more information on MKLINK, please refer to:                                                                                 ::
:: - https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink                                        ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: This script is provided as-is without any warranty. Use at your own risk.                                                        ::
:: If you encounter issues, please check the paths and permissions.                                                                 ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: For further assistance, refer to the official Microsoft documentation or community forums.                                       ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: This script is intended for educational purposes and to assist users in using the MKLINK command easily.                         ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
	CLS
	MODE CON COLS=85 LINES=30
	COLOR 4F
	TITLE Administrative Privileges Required
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                         Administrative Privileges Required                      ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO This script requires administrative privileges to run.
	ECHO Please right-click on this script and select "Run as administrator".
	ECHO Alternatively, you can open a command prompt as administrator and run this script from there.
	ECHO.
	ECHO If you continue to have issues, please refer to the official documentation or community forums for assistance.
	ECHO.
	ECHO For more information on running scripts with administrative privileges, visit:
	ECHO - https://docs.microsoft.com/en-us/windows/win32/shell/command-prompt-administrator
	ECHO - https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dive/administrative-tasks
	ECHO.
	ECHO Press any key to exit...
	PAUSE >NUL
	EXIT /B 1
)

CLS
MODE CON COLS=85 LINES=30
COLOR 9F
TITLE MKLINK Assistant
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Welcome to the MKLINK Assistant!
ECHO This script will help you create Symbolic Links, Hard Links, or Directory Junctions.
ECHO.
ECHO Please ensure you have the necessary permissions to create links in the specified directories.
ECHO If you encounter any issues, please refer to the official documentation or community forums for assistance.
ECHO.
ECHO For more information on MKLINK, visit:
ECHO - https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/hard-links
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/directory-junctions
ECHO.
ECHO Press any key to continue...
PAUSE >NUL

CLS
MODE CON COLS=85 LINES=30
COLOR 9F
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Please choose the type of link you want to create:

ECHO 1. Symbolic Link (SYMLINK)
ECHO 2. Hard Link
ECHO 3. Directory Junction
ECHO 4. Exit
ECHO.
SET /P CHOICE=Enter your choice (1-4):

IF "%CHOICE%"=="1" (
    SET TYPE=SYMLINK
) ELSE IF "%CHOICE%"=="2" (
    SET TYPE=HARDLINK
) ELSE IF "%CHOICE%"=="3" (
    SET TYPE=JUNCTION
) ELSE IF "%CHOICE%"=="4" (
    EXIT /B 0
) ELSE (
    GOTO ERROR
)

CLS
MODE CON COLS=85 LINES=30
COLOR 9F
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO You have chosen to create a %TYPE%.
ECHO Please provide the necessary paths below.
ECHO.
ECHO The target path is the file or directory you want to link to.
ECHO The link path is the name of the link you want to create.
ECHO.
ECHO Ensure that the target path exists and you have the necessary permissions to create links in the specified directories.
ECHO.
ECHO For more information on the types of links, please refer to the official documentation:
ECHO - Symbolic Links: https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links
ECHO - Hard Links: https://docs.microsoft.com/en-us/windows/win32/fileio/hard-links
ECHO - Directory Junctions: https://docs.microsoft.com/en-us/windows/win32/fileio/directory-junctions
ECHO.

SET /P TARGETPATH=Enter the target path (the file or directory you want to link to):
SET /P LINKPATH=Enter the path of the link (the link you want to create):

IF "%TYPE%"=="SYMLINK" (
   COPY "%TARGETPATH%" "%LINKPATH%"
   DEL /F /S /Q "%TARGETPATH%" 1>NUL
   RMDIR /S /Q "%TARGETPATH%"
   MKLINK /D "%LINKPATH%" "%TARGETPATH%"
) ELSE IF "%TYPE%"=="HARDLINK" (
   MKLINK /H "%LINKPATH%" "%TARGETPATH%"
) ELSE IF "%TYPE%"=="JUNCTION" (
   COPY "%TARGETPATH%" "%LINKPATH%"
   DEL /F /S /Q "%TARGETPATH%" 1>NUL
   RMDIR /S /Q "%TARGETPATH%"
   MKLINK /J "%LINKPATH%" "%TARGETPATH%"
) ELSE (
    GOTO ERROR
)

CLS
MODE CON COLS=85 LINES=30
COLOR 9F
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

IF %ERRORLEVEL% EQU 0 (
    GOTO SUCCESS
) ELSE (
    GOTO ERROR
)

:ERROR
CLS
MODE CON COLS=85 LINES=30
COLOR 4F
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO MKLINK Assistant has encountered an error.
ECHO.
ECHO Please ensure that:
ECHO - You have selected the correct type of link to create.
ECHO - The target path exists and is accessible.
ECHO - The link path does not already exist.
ECHO - You have the necessary permissions to create links in the specified directories.
ECHO - You are running this script with administrative privileges.
ECHO - The paths are correctly formatted and do not contain invalid characters.
ECHO.
ECHO Error Code: %ERRORLEVEL%
ECHO.
ECHO For more information on troubleshooting MKLINK issues, please refer to:
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/mklink
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/troubleshooting-mklink
ECHO.
ECHO Press any key to exit...
TIMEOUT /T 10 >NUL
EXIT /B 1

:SUCCESS
CLS
MODE CON COLS=85 LINES=30
COLOR 2F
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                MKLINK Assistant                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO The %TYPE% has been created successfully!
ECHO Link Path: %LINKPATH%
ECHO Target Path: %TARGETPATH%
ECHO.
ECHO Press any key to exit...
TIMEOUT /T 10 >NUL
EXIT /B 0

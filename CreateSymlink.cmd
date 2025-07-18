@ECHO OFF

REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: This script is designed to create a symbolic link in Windows.                                                                    ::
REM :: Ensure you run this script with administrative privileges.                                                                       ::
REM ::                                                                                                                                  ::
REM :: The script will prompt for the output path and the input folder to link to.                                                      ::
REM :: It will handle errors and provide feedback on the success or failure of the operation.                                           ::
REM ::                                                                                                                                  ::
REM :: Note: This script uses the MKLINK command, which requires administrative privileges.                                             ::
REM :: Ensure you have the necessary permissions to create symlinks on your system.                                                     ::
REM ::                                                                                                                                  ::
REM :: For more information on symlinks, visit: https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links                    ::
REM ::                                                                                                                                  ::
REM :: This script is provided as-is without any warranty. Use at your own risk.                                                        ::
REM :: If you encounter issues, please check the paths and permissions.                                                                 ::
REM ::                                                                                                                                  ::
REM :: For further assistance, refer to the official Microsoft documentation or community forums.                                       ::
REM ::                                                                                                                                  ::
REM :: This script is intended for educational purposes and to assist users in creating symlinks easily.                                ::
REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM Check if the script is run with administrative privileges
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
	ECHO This script requires administrative privileges to run.
	ECHO Please run this script as an administrator.
	PAUSE
	EXIT /B 1
)

REM Clear the screen and set up the console
CLS
MODE CON COLS=85 LINES=45
COLOR 1F
TITLE Symlink Creator
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                  Symlink Creator                                ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Welcome to the Symlink Creator!
ECHO This script will help you create a symbolic link (symlink) for a folder.
ECHO A symlink allows you to access a folder from a different location in the file system
ECHO without duplicating the contents of the folder.
ECHO.
ECHO Please follow the prompts to specify the output path for the symlink and the input
ECHO folder you want to link to.
ECHO.
ECHO Note: Ensure you have the necessary permissions to create symlinks on your system.
ECHO If you encounter any issues, please check the paths and permissions.
ECHO.
ECHO For more information on symlinks, visit:
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links
ECHO.
ECHO Press any key to continue...
PAUSE >NUL

REM Prompt for output path and input folder
CLS
MODE CON COLS=85 LINES=45
COLOR 1F
TITLE Symlink Creator - Input Required
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                  Symlink Creator                                ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Please enter the details for creating the symlink.
ECHO.
ECHO You will need to provide:
ECHO - The full path where you want to create the symlink (output path).
ECHO - The full path of the folder you want to link to (input folder).
ECHO.
ECHO Make sure the output path does not already exist, and the input folder exists and is 
ECHO accessible.
ECHO.
ECHO Press any key to continue...
PAUSE >NUL

SET /P "OUTPUT=Where do you want to create the symlink (full path):"
SET /P "INPUT=What folder do you want to link to (full path):"

CLS
MODE CON COLS=85 LINES=45
COLOR 1F
TITLE Symlink Creator
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                  Symlink Creator                                ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO This script will create a symbolic link (symlink) for the specified folder.
ECHO A symlink is a pointer to another folder, allowing you to access it from a 
ECHO different location.
ECHO.
ECHO Please ensure you have the necessary permissions to create symlinks on your
ECHO system.
ECHO If you encounter any issues, please check the paths and permissions.
ECHO.
ECHO For more information on symlinks, visit:
ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links
ECHO.
ECHO You have entered the following details:
ECHO.
ECHO Output Path:
ECHO - %OUTPUT%
ECHO.
ECHO Input Folder:
ECHO - %INPUT%
ECHO.
ECHO Press any key to create the symlink...
PAUSE >NUL

REM Create the symlink using MKLINK
MKLINK /D "%OUTPUT%" "%INPUT%"

REM Check the error level to determine if the symlink was created successfully
REM If the command was successful, ERRORLEVEL will be 0
REM If the output path already exists, ERRORLEVEL will be 1
REM If the input path does not exist, ERRORLEVEL will be 2
REM If an unknown error occurred, ERRORLEVEL will be greater than 2
CLS
MODE CON COLS=85 LINES=45
COLOR 1F
TITLE Symlink Creation Result
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                               Symlink Creation Result                           ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Checking the result of the symlink creation...
ECHO.
ECHO Please wait while we verify the operation...
ECHO.
TIMEOUT /T 2 >NUL

REM Check the ERRORLEVEL to determine the outcome of the MKLINK command
REM If the symlink was created successfully, ERRORLEVEL will be 0
REM If the output path already exists, ERRORLEVEL will be 1
REM If the input path does not exist, ERRORLEVEL will be 2
REM If an unknown error occurred, ERRORLEVEL will be greater than 2
IF %ERRORLEVEL% EQU 0 (
	REM If the symlink was created successfully, display a success message
	REM and provide information about the symlink
	CLS
	MODE CON COLS=85 LINES=45
	COLOR 1F
	TITLE Symlink Creation Successful
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                            Symlink Created Successfully                         ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO The symlink has been created successfully!
	ECHO.
	ECHO You can now access the folder at:
	ECHO - "%OUTPUT%"
	ECHO.
	ECHO The symlink points to the folder:
	ECHO - "%INPUT%"
	ECHO.
	ECHO If you need to create another symlink, you can run this script again.
	ECHO.
	ECHO For more information on symlinks, visit:
	ECHO - https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links
	ECHO.
	ECHO Thank you for using the Symlink Creator!
	TIMEOUT /T 10 >NUL
	EXIT /B 0
) ELSE IF %ERRORLEVEL% EQU 1 (
	REM If the output path already exists, display an error message
	REM and prompt the user to choose a different output path
	CLS
	MODE CON COLS=85 LINES=45
	COLOR 4F
	TITLE Error: Output Path Already Exists
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                            Error: Output Path Already Exists                    ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO The specified output path already exists.
	ECHO Please choose a different output path that does not already exist.
	ECHO.
	ECHO Press any key to exit...
	PAUSE >NUL
	EXIT /B 1
) ELSE IF %ERRORLEVEL% EQU 2 (
	REM If the input path does not exist, display an error message
	REM and prompt the user to check the input path
	CLS
	MODE CON COLS=85 LINES=45
	COLOR 4F
	TITLE Error: Input Path Does Not Exist
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                            Error: Input Path Does Not Exist                     ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO The specified input folder does not exist.
	ECHO Please check the path and ensure it is correct.
	ECHO.
	ECHO Press any key to exit...
	PAUSE >NUL
	EXIT /B 2
) ELSE (
	REM If an unknown error occurred, display a generic error message
	REM and prompt the user to check the paths and permissions
	CLS
	MODE CON COLS=85 LINES=45
	COLOR 4F
	TITLE Symlink Creation Failed
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                               Symlink Creation Failed                           ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO An error occurred while trying to create the symlink.
	ECHO.
	ECHO Please check the following:
	ECHO - Ensure the specified output path does not already exist.
	ECHO - Ensure the specified input path exists and is accessible.
	ECHO - Ensure you have administrative privileges to create symlinks.
	ECHO.
	TIMEOUT /T 10 >NUL
	EXIT /B
)

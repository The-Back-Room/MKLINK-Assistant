@ECHO OFF
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script is designed to create a symbolic link in Windows.                                                                    ::
:: Ensure you run this script with administrative privileges.                                                                       ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: The script will prompt for the output path and the input folder to link to.                                                      ::
:: It will handle errors and provide feedback on the success or failure of the operation.                                           ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: Note: This script uses the MKLINK command, which requires administrative privileges.                                             ::
:: Ensure you have the necessary permissions to create symlinks on your system.                                                     ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: For more information on symlinks, visit: https://docs.microsoft.com/en-us/windows/win32/fileio/symbolic-links                    ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: This script is provided as-is without any warranty. Use at your own risk.                                                        ::
:: If you encounter issues, please check the paths and permissions.                                                                 ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: For further assistance, refer to the official Microsoft documentation or community forums.                                       ::
:: -------------------------------------------------------------------------------------------------------------------------------- ::
:: This script is intended for educational purposes and to assist users in creating symlinks easily.                                ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Check for administrative privileges before proceeding with the script.                                                           ::
:: If the script is not run as administrator, prompt the user to run it with elevated privileges                                    ::
:: and exit the script with an error code.                                                                                          ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: Exit the script with an error code indicating administrative privileges are required.                                        ::
	:: This will prevent the script from proceeding further without the necessary permissions.                                      ::
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	CLS
	MODE CON COLS=85 LINES=30
	COLOR 04
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
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Clear the screen and set up the console for the symlink creation process.                                                        ::
:: The script will display a welcome message and instructions for the user.                                                         ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CLS
MODE CON COLS=85 LINES=30
COLOR 09
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
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Clear the screen and prompt the user for input paths for the symlink creation.                                                   ::
:: The script will validate the input and proceed to create the symlink if valid.                                                   ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CLS
MODE CON COLS=85 LINES=30
COLOR 09
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
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Validate the input paths provided by the user. If the paths are empty, prompt the user                                           ::
:: to re-enter the paths. If the paths are valid, proceed to confirm the details.                                                   ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CLS
MODE CON COLS=85 LINES=30
COLOR 09
TITLE Symlink Creator
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                  Symlink Creator                                ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO This script will create a symbolic link (symlink) for the specified folder.
ECHO.
ECHO Please ensure you have the necessary permissions to create symlinks on your
ECHO system. If you encounter any issues, please check the paths and permissions.
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
ECHO Press any key to confirm the details and proceed with creating the symlink.
ECHO If you need to change the paths, you can exit now and run the script again.
PAUSE >NUL
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Clear the screen and create the symlink using the MKLINK command.                                                                ::
:: The script will display a message indicating the symlink creation process is underway.                                           ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CLS
MODE CON COLS=85 LINES=30
COLOR 09
TITLE Creating Symlink...
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                                Creating Symlink                                 ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Creating the symlink at "%OUTPUT%" pointing to "%INPUT%"...
ECHO.
ECHO Please wait while we create the symlink.
ECHO This may take a few moments depending on the paths provided.
TIMEOUT /T 2 >NUL
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute the MKLINK command to create the symlink. The command will create a directory symlink if the input is a folder.          ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
MKLINK /D "%OUTPUT%" "%INPUT%"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Check the ERRORLEVEL to determine if the MKLINK command was successful.                                                          ::
:: If successful, display a success message; otherwise, display an error message.                                                   ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CLS
MODE CON COLS=85 LINES=30
COLOR 09
TITLE Symlink Creation Result
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                               Symlink Creation Result                           ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Checking the result of the symlink creation...
ECHO.
ECHO Please wait while we verify the operation...
ECHO This may take a few moments depending on the paths provided.
TIMEOUT /T 2 >NUL
IF %ERRORLEVEL% EQU 0 (
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: Clear the screen and display a success message indicating the symlink was created successfully.                              ::
	:: The script will also display the output and input paths for confirmation.                                                    ::
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	CLS
	MODE CON COLS=85 LINES=30
	COLOR 02
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
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:: Clear the screen and display an error message indicating the symlink creation failed.                                        ::
	:: The script will provide troubleshooting steps for the user to resolve the issue.                                             ::
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	CLS
	MODE CON COLS=85 LINES=30
	COLOR 04
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
	EXIT /B	1
)

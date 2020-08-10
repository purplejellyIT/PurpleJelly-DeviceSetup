REM Copy Admin profile data to destination folder, e.g. Default user (so that newly created users start with the Admin profile data which has been configured).
REM 15.10.2016

SET SRC=C:\Users\Admin\
SET DEST=D:\tmp\TestUser
SET WIN10_MENU_FILE=C:\IT\config\Win10Menu\Win10MenuDefaultLayoutModification.xml
SET COPY_CMD=ROBOCOPY /NFL /NDL /NJH /NJS /NC /NS /NP
REM SET COPY_CMD=ROBOCOPY

IF "%1"=="-d" SET DEST=C:\Users\Default

REM Copy important ROBOCOPY
IF NOT EXIST %DEST% MKDIR %DEST%

SET ITEMS=.keystore .bash_history
ECHO Copy %ITEMS% to %DEST%
%COPY_CMD% "%SRC%" "%DEST%" %ITEMS%

SET ITEM=.VirtualBox
ECHO Copy %ITEM% to %DEST%
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% /MIR "%SRC%%ITEM%" "%DEST%\%ITEM%"

SET ITEM=Desktop
ECHO Copy %ITEM% to %DEST%
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% "%SRC%%ITEM%" "%DEST%\%ITEM%"

SET ITEM=Documents
ECHO Copy %ITEM% to %DEST%
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% "%SRC%%ITEM%" "%DEST%\%ITEM%"

SET ITEM=.squirrel-sql
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% /MIR "%SRC%%ITEM%" "%DEST%\%ITEM%"

SET ITEM=AppData\Roaming\Microsoft\Windows\Start Menu\Programs
ECHO Copy %ITEM% to %DEST%
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% /E "%SRC%%ITEM%" "%DEST%\%ITEM%"
REM "VM_Win10Pro_64bit_en_dev.lnk" "STS.lnk" "Eclipse.lnk" "Bash on Ubuntu on Windows.lnk" "Startup" "SQuirreL SQL Client" "grepWin" "WinDirStat"

SET ITEM=AppData\Roaming\Microsoft\Windows\SendTo
ECHO Copy %ITEM% to %DEST%
IF NOT EXIST "%DEST%\%ITEM%" MKDIR "%DEST%\%ITEM%"
%COPY_CMD% /E "%SRC%%ITEM%" "%DEST%\%ITEM%" tmp*.lnk

REM Copy Win10 Start menu

REM http://www.patsblog.de/2015/08/26/windows-10-deployment-start-menu-powershell-xml-import/
REM http://www.patsblog.de/2016/05/11/windows-10-startmenue-sichern-und-wiederherstellen/
REM C:\Users\Default\AppData\Local\Microsoft\Windows\Shell

powershell -NonInteractive -Command "& {&'Export-StartLayout' -Path %WIN10_MENU_FILE%}"
powershell -NonInteractive -Command "& {&'Import-StartLayout' -LayoutPath %WIN10_MENU_FILE% -MountPath $env:SystemDrive\}"

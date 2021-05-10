@echo off
echo Checking Hardware compactibilites
wmic /namespace:\\root\cimv2\security\microsofttpm path win32_tpm get IsEnabled_InitialValue
wmic /namespace:\\root\cimv2\security\microsofttpm path win32_tpm get IsActivated_InitialValue
wmic /namespace:\\root\cimv2\security\microsofttpm path win32_tpm get IsOwned_InitialValue
manage-bde -status
echo Preparing partition for Bitlocker
powershell.exe -Command "BdeHdCfg.exe -target %SystemDrive% shrink >> C:\PurpleJelly\%computername%_bitlockerlog.txt"
echo Creating a recovery key (for emergency access only, stored in AD)
powershell.exe -Command "manage-bde.exe -protectors -add c: -recoverypassword >> C:\PurpleJelly\%computername%_bitlockerlog.txt"
echo Creating the TPM key (used to auto boot encrypted OS)
powershell.exe -Command "manage-bde.exe -protectors -add %SystemDrive% -tpm >> C:\PurpleJelly\%computername%_bitlockerlog.txt"
echo Enabling BitLocker Encryption
powershell.exe -Command "manage-bde.exe -on %systemdrive% >> C:\PurpleJelly\%computername%_bitlockerlog.txt"
shutdown /r /f /t 300 /c "PC will restart in 300 Seconds, to start the Encryption Process...."







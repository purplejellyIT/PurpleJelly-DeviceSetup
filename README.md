Recommended install process;

- Run a clean installation of Windows. When we receive new laptops we will always wipe the device and do a fresh install.
- Once loading the desktop for the first time, the first and only thing we do is disable UAC. 
- Copy RunMe.bat and download.ps1 to a USB and run the RunMe.bat file. 
- The .bat will run the download.ps1 file which downloads the latest version of the PC setup script on GitHub.

Once the PC has restarted then join to Azure AD or Domain then go to C:\PurpleJelly\PurpleJelly-DeviceSetup-master\ and right click on UserSetUp.ps1 and run with Powershell.

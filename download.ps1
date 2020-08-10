Set-ExecutionPolicy remotesigned
function downloadbuilder {
Invoke-WebRequest -Uri "https://github.com/williamyoung2196/PC-Build-Script/archive/master.zip" -OutFile "C:\PurpleJelly\PJDeviceSetup.zip"
Expand-Archive C:\PurpleJelly\PJDeviceSetup.zip -DestinationPath C:\PurpleJelly\
}
downloadbuilder
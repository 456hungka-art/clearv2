@echo off
title ASPAS REMOCE APP
color 0c


pause


taskkill /f /im OneDrive.exe >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
%SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul 2>&1
rd "%UserProfile%\OneDrive" /s /q >nul 2>&1
cls
powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *microsoftsolitairecollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *onenote* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
cls
echo [+] Disabling Edge Background Activity...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "QuietVisuals" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch" /f >nul 2>&1
cls
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
cls
echo [+] Deep Cleaning Temp files...
del /q /f /s %temp%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
del /q /f /s C:\Windows\Prefetch\* >nul 2>&1
cls
echo [+] Launching CTT Optimizer...
powershell -Command "irm christitus.com/win | iex"
pause
exit
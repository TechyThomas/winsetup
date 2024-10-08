# Registry tweaks

Write-Host "Making reqistry tweaks..." -ForegroundColor Cyan

UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -Value 1 # Show taskbar labels unless full
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "MMTaskbarGlomLevel" -Value 1 # Show taskbar labels on other monitors unless full
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "MMTaskbarMode" -Value 2 # Show apps only on taskbar of screen they are on
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -Value 1 # Show seconds in taskbar clock
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0 # Hide search in taskbar
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 # Hide task view in taskbar

UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "AutoCheckSelect" -Value 0 # Hide item check boxes
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 # Show hidden files
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 # Show file extensions
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1 # Go to This PC by default

UpdateRegistry -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -Value 1 # Enable developer mode
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" -Name "TaskbarEndTask" -Value 1 # Show end task in taskbar
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 # Enable dark mode for apps
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 # Enable dark mode system wide
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 1 # Enable transparent effect
UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "ColorPrevalence" -Value 0 # Disable accent colour on taskbar and windows

$userSID = (Get-WmiObject win32_useraccount | ? { $_.name -eq $Env:USERNAME }).SID
UpdateRegistry -Path "Registry::\HKEY_USERS\${userSID}\Control Panel\International" -Name "sShortDate" -Value "dd MMM yyyy" -Type String # Set short date format e.g. 04 Sep 2024

# Restart Windows Explorer to apply registry changes

Write-Host "Restarting Windows Explorer..." -ForegroundColor Cyan
taskkill /f /im explorer.exe
Start-Process explorer.exe

Write-Host "Windows Config Applied" -ForegroundColor Green
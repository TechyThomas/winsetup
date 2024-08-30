# Includes

. ".\functions.ps1"

# Intro

$title = @"

  _______        _        _______ _
 |__   __|      | |      |__   __| |
    | | ___  ___| |__  _   _| |  | |__   ___  _ __ ___   __ _ ___
    | |/ _ \/ __| '_ \| | | | |  | '_ \ / _ \| '_ ` _ \ / _` / __|
    | |  __/ (__| | | | |_| | |  | | | | (_) | | | | | | (_| \__ \
    |_|\___|\___|_| |_|\__, |_|  |_| |_|\___/|_| |_| |_|\__,_|___/
                        __/ |
                       |___/

 __          ___          _____      _                  _____           _       _
 \ \        / (_)        / ____|    | |                / ____|         (_)     | |
  \ \  /\  / / _ _ __   | (___   ___| |_ _   _ _ __   | (___   ___ _ __ _ _ __ | |_
   \ \/  \/ / | | '_ \   \___ \ / _ \ __| | | | '_ \   \___ \ / __| '__| | '_ \| __|
    \  /\  /  | | | | |  ____) |  __/ |_| |_| | |_) |  ____) | (__| |  | | |_) | |_
     \/  \/   |_|_| |_| |_____/ \___|\__|\__,_| .__/  |_____/ \___|_|  |_| .__/ \__|
                                              | |                        | |
                                              |_|                        |_|
"@

Write-Host $title -ForegroundColor Magenta
Write-Host "Installing packages..." -ForegroundColor Cyan

# Install packages

InstallPackage -PackageId "Discord.Discord" -PackageName "Discord"
InstallPackage -PackageId "Microsoft.VisualStudioCode" -PackageName "VS Code"
InstallPackage -PackageId "Microsoft.PowerToys" -PackageName "PowerToys"
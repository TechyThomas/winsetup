param (
  [switch]$config,
  [switch]$apps
)

$baseUrl = "https://raw.githubusercontent.com/TechyThomas/winsetup/main/src"

# Function to download and execute scripts
function Include-Script {
    param (
        [string]$ScriptPath
    )
    $scriptUrl = "$baseUrl/$ScriptPath"
    $scriptContent = (Invoke-WebRequest -Uri $scriptUrl -UseBasicParsing).Content
    Invoke-Expression $scriptContent
}

# Include functions directly
$functionsUrl = "$baseUrl/includes/functions.ps1"
$functionsContent = (Invoke-WebRequest -Uri $functionsUrl -UseBasicParsing).Content

try {
    $functionsContent = (Invoke-WebRequest -Uri $functionsUrl -UseBasicParsing).Content
    Invoke-Expression $functionsContent
}
catch {
    Write-Error "Failed to load functions: $_"
    exit 1
}

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

if ($config -or (-not $config -and -not $apps)) {
    Include-Script "scripts/set-config.ps1"
}

if ($apps -or (-not $config -and -not $apps)) {
    Include-Script "scripts/install-apps.ps1"
}
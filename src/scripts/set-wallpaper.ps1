# Download and set wallpapers

Write-Host "Setting wallpapers..." -ForegroundColor Cyan

If (-not (IsPackageInstalled("Git.Git"))) {
    Write-Host "Git is not installed" -ForegroundColor Yellow
    InstallPackage -PackageId "Git.Git" -PackageName "Git"
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

Write-Host "Downloading wallpapers..." -ForegroundColor Yellow

$wallpaperPath = "$env:USERPROFILE\Pictures\nord-background"

git clone https://github.com/ChrisTitusTech/nord-background.git $wallpaperPath

# Set wallpaper to slideshow
$slideshowPath = "HKCU:\Control Panel\Personalization\Desktop Slideshow"

UpdateRegistry -Path $slideshowPath -Name "Interval" -Value 1800000 # 30 minutes in seconds
UpdateRegistry -Path $slideshowPath -Name "SlideshowDirectoryPath" -Value $wallpaperPath -Type String
UpdateRegistry -Path $slideshowPath -Name "Shuffle" -Value 1

# Apply the wallpaper settings
$code = @'
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet=CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@

Add-Type $code
[Wallpaper]::SystemParametersInfo(20, 0, $null, 3)

Write-Host "Wallpaper set to slideshow from $wallpaperPath" -ForegroundColor Green
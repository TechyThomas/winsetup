function IsPackageInstalled {
    param (
        [Parameter(Mandatory=$true)]
        [string]$PackageId
    )

    # Query winget to see if the package with the specified ID is installed
    $package = winget list --id $PackageId

    # Check if the package was found
    if ($package -match $PackageId) {
        return $true
    } else {
        return $false
    }
}

function InstallPackage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$PackageId,

        [Parameter(Mandatory=$true)]
        [string]$PackageName
    )

    if (IsPackageInstalled($PackageId)) {
        Write-Host "$PackageName is installed, skipping..." -ForegroundColor Yellow
        return
    }

    Write-Output "Installing $PackageName..."
    winget install $PackageId

    if (IsPackageInstalled($PackageId)) {
        Write-Host "$PackageName installed" -ForegroundColor Green
    }
    else {
        Write-Host "Failed to install $PackageName" -ForegroundColor Red
    }
}
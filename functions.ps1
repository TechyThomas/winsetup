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
    winget install $PackageId --silent --accept-package-agreements --accept-source-agreements

    # if (IsPackageInstalled($PackageId)) {
    #     Write-Host "$PackageName installed" -ForegroundColor Green
    # }
    # else {
    #     Write-Host "Failed to install $PackageName" -ForegroundColor Red
    # }
}

function Test-RegistryValue {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    $exists = Get-ItemProperty -LiteralPath $Path -Name $Name -ErrorAction SilentlyContinue

    if (($null -ne $exists) -and ($exists.Length -ne 0)) {
        return $true
    }

    return $false
}

function UpdateRegistry {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        $Value,

        [Parameter(Mandatory = $false)]
        $Type = "DWORD"
    )

    # Create the key if it does not exist
    If (-NOT (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    if (Test-RegistryValue -Path $Path -Name $Name) {
        Set-ItemProperty -LiteralPath $Path -Name $Name -Value $Value
        Write-Host "Set key $Name to ${Value}"
    }
    else {
        New-ItemProperty -LiteralPath $Path -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
        Write-Host "Created key $Name with value ${Value}"
    }
}
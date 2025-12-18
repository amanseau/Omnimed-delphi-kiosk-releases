param(
    [string]$VersionNumber
)

if (-not $VersionNumber) {
    Write-Host "Please provide a version number as an input parameter."
    exit
}

$sourceFolderPath = "C:\Omnimed-delphi-Kiosk"
$destinationFolderPath = "C:\Omnimed-delphi-Kiosk-releases"

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path "$destinationFolderPath\$VersionNumber" -PathType Container)) {
    New-Item -Path "$destinationFolderPath\$VersionNumber" -ItemType Directory -Force
}

# Copy the executable files
Copy-Item -Path "$sourceFolderPath\GestBorne\GestBorne.exe" -Destination "$destinationFolderPath\$VersionNumber"
Copy-Item -Path "$sourceFolderPath\Borne\Borne.exe" -Destination "$destinationFolderPath\$VersionNumber"

# Generate last-modified.dat file
$OutputPath = Join-Path -Path "$destinationFolderPath\$VersionNumber" -ChildPath 'last-modified.dat'
Get-ChildItem -File -Path "$destinationFolderPath\$VersionNumber" -Recurse | ForEach-Object { $_.Name + '=' + $_.LastWriteTime.toString('yyyy.MM.dd HH:mm:ss') } | Out-File -FilePath $OutputPath -Encoding Default
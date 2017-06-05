$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'vifm'
  url            = 'https://github.com/vifm/vifm/releases/download/v0.9-beta/vifm-w32-se-0.9-beta-binary.zip'
  url64bit       = 'https://github.com/vifm/vifm/releases/download/v0.9-beta/vifm-w64-se-0.9-beta-binary.zip'
  checksum       = '7723C9F14697893246880CF0E9D44D89A07D46C38ABBC71AE5DA8CDA9CAB213E'
  checksumType   = 'sha256'
  checksum64     = '3304D31FC4617C6999D1AD215039621883FC0FD6F080B17137DE7D14C930EB4B'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs


# exclude generate shim(s)
$ignoreWinHelper = 'win_helper.exe.ignore'

if ((Get-ProcessorBits 64) -and ($env:chocolateyForceX86 -ne 'true')) {
    $zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url64bit)
}else{
    $zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)
}

New-Item "${toolsPath}\${zipName}\${ignoreWinHelper}" -type file -force | Out-Null
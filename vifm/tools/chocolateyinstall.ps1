$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'vifm'
  url            = 'https://github.com/vifm/vifm/releases/download/v0.10/vifm-w32-se-0.10-binary.zip'
  url64bit       = 'https://github.com/vifm/vifm/releases/download/v0.10/vifm-w64-se-0.10-binary.zip'
  checksum       = 'E85A8782C4BB30E6CDEEC638442DA44B03826C4A6DA069BB5A2BBEDFF25C337399A9721C3D46A538EE16426CF3D9F86503BD1B76B7232D1FFED613FC46EF7CD7'
  checksumType   = 'sha512'
  checksum64     = '186E39DE311B6E8EDEAD57C159790F05C620E2387DD7DB5B9EB52DBD4B23463274328A68E0905CB70050C8D58E6F64DE49E01EB940660BA7B3F9E03E802A306E'
  checksumType64 = 'sha512'
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
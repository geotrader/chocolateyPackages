$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'mactype'
  fileType       = 'exe'
  url            = 'https://github.com/snowie2000/mactype/releases/download/v1.2016.904.0/MacTypeInstaller_2016_0904_0.exe'
  url64bit       = 'https://github.com/snowie2000/mactype/releases/download/v1.2016.904.0/MacTypeInstaller_2016_0904_0.exe'
  silentArgs     = '/quiet'
  checksum       = 'AF3F40F05A3BA2383A54BC4FF3AAE4C6877C64010EF50FD111A10E3D0420DA70'
  checksumType   = 'sha256'
  checksum64     = 'AF3F40F05A3BA2383A54BC4FF3AAE4C6877C64010EF50FD111A10E3D0420DA70'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyPackage @packageArgs

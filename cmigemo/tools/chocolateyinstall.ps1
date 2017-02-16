$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cmigemo'
  url            = 'https://github.com/koron/cmigemo/archive/rel-1_2.zip'
  url64bit       = 'https://github.com/koron/cmigemo/archive/rel-1_2.zip'
  checksum       = '39E6B396E0B477F71A93207E0727575ECF3118CE1DF5D6D986DAC61FD433E6FF'
  checksumType   = 'sha256'
  checksum64     = '39E6B396E0B477F71A93207E0727575ECF3118CE1DF5D6D986DAC61FD433E6FF'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
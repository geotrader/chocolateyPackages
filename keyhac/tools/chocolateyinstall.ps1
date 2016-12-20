$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'keyhac'
  url            = 'http://crftwr.github.io/keyhac/download/keyhac_176.zip'
  checksum = '40E4108DAABDC5EFF2165DAE62C11CB9FB5DCCCA2D27067DDCE10B1820D06B35'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
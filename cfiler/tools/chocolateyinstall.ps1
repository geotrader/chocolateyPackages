$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cfiler'
  url            = 'http://crftwr.github.io/cfiler/download/cfiler_245.zip'
  checksum = 'C05D967CEAE1777608625AF269E737F9C76A1EF2B7AF31B509D6BAA017746981'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
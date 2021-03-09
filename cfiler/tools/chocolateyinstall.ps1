$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cfiler'
  url            = 'https://crftwr.github.io/cfiler/download/cfiler_261.zip'
  checksum	     = 'A7E09C65C985F567B3AC9D3FC53D3312E9CE5CBE97E22760069D7B8116642A1C27A04C466A79511F8BF27BD7A3962296D09E84D6B20F35C58DD2A7863C76078B'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
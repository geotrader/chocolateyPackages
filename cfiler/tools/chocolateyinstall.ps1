$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cfiler'
  url            = 'http://crftwr.github.io/cfiler/download/cfiler_245.zip'
  checksum = 'B9F256C143C6CA3A4DC4C9BB2BAE17A86A5070971E71F956C8D4E7B45992E5A2549CF14740365CEEE6013EE9325C4235E014E90F8095F0BF656EA17D589276FE'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
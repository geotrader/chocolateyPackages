$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'zadig'
  fileFullPath  = Join-Path $toolsPath 'zadig.exe'  
  url            = 'http://zadig.akeo.ie/downloads/zadig-2.3.exe'
  url64bit       = 'http://zadig.akeo.ie/downloads/zadig-2.3.exe'
  checksum       = 'E2695E5732A8B512DB00B5B7D5DB4854195E82D343633C245E50F26363CAFB2E'
  checksumType   = 'sha256'
  checksum64     = 'E2695E5732A8B512DB00B5B7D5DB4854195E82D343633C245E50F26363CAFB2E'
  checksumType64 = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
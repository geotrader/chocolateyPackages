$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'clnch'
  url            = 'http://crftwr.github.io/clnch/download/clnch_333.zip'
  checksum = 'B8F2A1AFBFF428FDAC8728A0F5BD7400ED4C0D063B905A1AD35322141C9D1261'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
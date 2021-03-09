$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'keyhac'
  url            = 'https://crftwr.github.io/keyhac/download/keyhac_182.zip'
  checksum       = 'A5BC51069E0358B551227AF010256CCBD2043F46663B4EEB59CDC55A67186099DB27BB838E0E75392A70B4C9DEEC7D915D34ECE266CD93773A6E9CD919EF32DF'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
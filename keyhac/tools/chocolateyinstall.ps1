$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'keyhac'
  url            = 'http://crftwr.github.io/keyhac/download/keyhac_176.zip'
  checksum = '56F8AB2AC758C68F2B3C5E635F88F2E1E38B048D5E9A5B1CA5C5E1BAB7A8C7A9537EEFDB93FC4E3F79FBFC168E030AF4AFBCE07213654EF6E06A0E02C4533EA3'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
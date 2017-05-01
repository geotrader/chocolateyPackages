$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'everyting.portable'
  url            = 'https://www.voidtools.com/Everything-1.4.1.867b.x86.zip'
  url64bit       = 'https://www.voidtools.com/Everything-1.4.1.867b.x64.zip'
  checksum       = '53F97A428F2464DF5EF516FE2541CB150F72DFC5176B1D1F2EFB8A09103434199'
  checksumType   = 'sha256'
  checksum64     = '8DA2B7B6F80B8BCE4318AC7B8C45483BB0DC81DB6C73C1A9EAEB9067616E6363'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
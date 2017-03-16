$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'nomeiryoui'
  url            = 'http://tatsu.life.coocan.jp/Archives/noMeiryoUI232.zip'
  url64bit       = 'http://tatsu.life.coocan.jp/Archives/noMeiryoUI232.zip'
  checksum       = '9EFE2195A4B81FF1053A2EEDB3F05811EE38864A8989DE57194D309AF625566D'
  checksumType   = 'sha256'
  checksum64     = '9EFE2195A4B81FF1053A2EEDB3F05811EE38864A8989DE57194D309AF625566D'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'livesplit'
  url            = 'https://github.com/LiveSplit/LiveSplit/releases/download/1.7.6/LiveSplit_1.7.6.zip'
  checksum       = '514EB4206AAD0646E41C457A9E21B1B1CAC775EB658B67F0E66FD532F9A58925E142E920635CCF57E2649971372E265431D5584277D85B4F0855313941CD4F87'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

# exclude generate shim(s)
$ignoreFiles = @(
  'LiveSplit.Register.exe.ignore'
)

$zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)

foreach($ignoreFile in $ignoreFiles) {
  New-Item "${toolsPath}\${ignoreFile}" -type file -force | Out-Null
}
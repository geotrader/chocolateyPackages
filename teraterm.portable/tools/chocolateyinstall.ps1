$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'teraterm.portable'
  url            = 'https://osdn.net/projects/ttssh2/downloads/67769/teraterm-4.95.zip'
  checksum       = '2f06011eb3e7faa8f4f004b9fb5262b57751ec02c762cb92b4bd8a615f44664c'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
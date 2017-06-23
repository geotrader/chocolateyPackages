$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'livesplit'
  url            = 'https://github.com/LiveSplit/LiveSplit/releases/download/1.7.4/LiveSplit_1.7.4.zip'
  checksum       = '02B4C319C408E27CE7DB4EAFF876E52759CA5FACF20E46ED46A05C8C38DFE06C'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

# exclude generate shim(s)
$ignoreFiles = @(
  'LiveSplit.Register.exe.ignore'
)

$zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)

foreach($ignoreFile in $ignoreFiles) {
  New-Item "${toolsPath}\${zipName}\${ignoreFile}" -type file -force | Out-Null
}
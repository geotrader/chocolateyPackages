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

# exclude generate shim(s)
$ignoreFiles = @(
  'Collector.exe.ignore',
  'Collector/Collector.exe.ignore',
  'Collector_org.exe.ignore',
  'Collector/Collector_org.exe.ignore',
  'cygterm.exe.ignore',
  'cygterm+-i686/cygterm.exe.ignore',
  'cygterm+-x86_64/cygterm.exe.ignore',
  'keycode.exe.ignore',
  'ttpmenu.exe.ignore',
  'cyglaunch.exe.ignore'
)


$zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)

foreach($ignoreFile in $ignoreFiles) {
  New-Item "${toolsPath}\${zipName}\${ignoreFile}" -type file -force | Out-Null
}
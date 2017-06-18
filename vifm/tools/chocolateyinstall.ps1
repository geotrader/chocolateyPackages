$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'vifm'
  url            = 'https://github.com/vifm/vifm/releases/download/v0.9/vifm-w32-se-0.9-binary.zip'
  url64bit       = 'https://github.com/vifm/vifm/releases/download/v0.9/vifm-w64-se-0.9-binary.zip'
  checksum       = '058A8EB32D32E9C463054FB264781DA8249B49C34706760C2F9BCCFC99030E20'
  checksumType   = 'sha256'
  checksum64     = '3E8193F8A5FFC0FC35F4B40DAB79CA647446E9B85592A890BDFACC7D336150C6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs


# exclude generate shim(s)
$ignoreWinHelper = 'win_helper.exe.ignore'

if ((Get-ProcessorBits 64) -and ($env:chocolateyForceX86 -ne 'true')) {
    $zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url64bit)
}else{
    $zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)
}

New-Item "${toolsPath}\${zipName}\${ignoreWinHelper}" -type file -force | Out-Null
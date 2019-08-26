$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'vifm'
  url            = 'https://github.com/vifm/vifm/releases/download/v0.10.1/vifm-w32-se-0.10.1-binary.zip'
  url64bit       = 'https://github.com/vifm/vifm/releases/download/v0.10.1/vifm-w64-se-0.10.1-binary.zip'
  checksum       = '4CCC6FA94AE14C88E29E414090D234F539C2DB230F1931CD7C14FC1AF2569E27D2038BCD6D32C5C38CCD1A33F37AA63DB99CBE0B22512ADBD4A01449873AC6D4'
  checksumType   = 'sha512'
  checksum64     = '4F41322204F7C50833BD5886F4AAFA2BBB92576289BA4FEF0B40382E20C19359A9D83BE842C4ABB1EC2CB78876F5EC0767FC58971697CDFF431A55AD7C4246D6'
  checksumType64 = 'sha512'
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
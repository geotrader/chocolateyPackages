$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'vifm'
  url            = 'https://github.com/vifm/vifm/releases/download/v0.8.2/vifm-w32-se-0.8.2-binary.zip'
  url64bit       = 'https://github.com/vifm/vifm/releases/download/v0.8.2/vifm-w64-se-0.8.2-binary.zip'
  checksum       = 'B0D5CA6C98D0DE5530CB584F3F17EEDBCDADB9A6B955EBB89CFEF2EFF8AEAAD8'
  checksumType   = 'sha256'
  checksum64     = '9EB536B697E1B1936F17F0EF78CF5C12363AB83CC9689DA83487277F07EC48E4'
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
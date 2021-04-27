$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'zadig'
  fileFullPath   = Join-Path $toolsPath 'zadig.exe'
  url            = 'https://github.com/pbatard/libwdi/releases/download/b730/zadig-2.5.exe'
  checksum       = 'A9BB1F47C790C8662AEFF985D59B9A68ADCF70F8CFA6EB10080BF53CDA49E67277943AAA08D8F26A2CCB1A153EE616F90E329C79A47730270BF48AE92B4530FA'
  checksumType   = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
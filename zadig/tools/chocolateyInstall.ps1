$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'zadig'
  fileFullPath   = Join-Path $toolsPath 'zadig.exe'
  url            = 'https://github.com/pbatard/libwdi/releases/download/b721/zadig-2.4.exe'
  checksum       = '034093ECE4F6020E6DEE686EBD7E197BA4BDCF10C96F5C1934CD0C8120C1E229B7832D26421802C2D572B322E7ED3FA00D495C7DBF1BAD73D70D22AA7E71219C'
  checksumType   = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
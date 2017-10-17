$ErrorActionPreference = 'Stop';

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'neovim'
  unzipLocation = $toolsPath
  url           = 'https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip'
  checksum      = 'FC34892C2EBAD1360025C9792941E077F063DF36E344D5A73DB240DC379CD5B4D50BD2C156BD58B565EBD8622C4A04CC6FDE4DA03D48F08A678E45A1A487C32A'
  checksumType  = 'sha512'

}

Install-ChocolateyZipPackage @packageArgs
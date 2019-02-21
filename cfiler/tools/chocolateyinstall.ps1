$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cfiler'
  url            = 'https://crftwr.github.io/cfiler/download/cfiler_249.zip'
  checksum	 = '934558C5313990620CD23FEE25C668BF1FAC1D5663EC41E45B2E93BD4F5E832A055A5FEAAB93928A0C87582BF218024CF53728047D7FFB81FB1ED23618DFAE61'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
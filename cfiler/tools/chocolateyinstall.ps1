$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'cfiler'
  url            = 'https://crftwr.github.io/cfiler/download/cfiler_247.zip'
  checksum = '8873F26FB9988B1340DCBC4D34FBBEA7FF19A8264C9FAE2AB2F684A1D49F8D1C0D24A1EEE95305FB20171196C92F8B8EF5AA432DA6F3427E61BF32220D804A7B'
  checksumType   = 'sha512'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
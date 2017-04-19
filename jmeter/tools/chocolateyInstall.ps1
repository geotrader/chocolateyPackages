$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.zip'
  url64bit       = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.zip'
  checksum       = '5A4EFC5A0D195004481BF899468B025D98F4EB161F04F6497B1D101EFB97E798'
  checksumType   = 'sha256'
  checksum64     = '5A4EFC5A0D195004481BF899468B025D98F4EB161F04F6497B1D101EFB97E798'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

# Custom batch shim
try {
  cp $toolsPath\jmeter.cmd $env:ChocolateyInstall\bin
  cp $toolsPath\jmeterw.cmd $env:ChocolateyInstall\bin
} catch {
  throw $_.Exception.Message
}
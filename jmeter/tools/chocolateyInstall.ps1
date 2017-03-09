$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.zip'
  url64bit       = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.zip'
  checksum       = '71DDFDFC324D8877C4DA0DFBE9A860C5C10F5D233F4D84B2055252C0CDF76A6E'
  checksumType   = 'sha256'
  checksum64     = '71DDFDFC324D8877C4DA0DFBE9A860C5C10F5D233F4D84B2055252C0CDF76A6E'
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
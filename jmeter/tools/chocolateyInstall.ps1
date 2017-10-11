$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.zip'
  checksum       = '23C72D38F2AB45B4D21349610578AA84829F58CBBC9239196B5C2D7168460E88D863ADD8708E9C3048841FE4FBC1C410213BFE7A0DF04368910FFEAB99BA1F02'
  checksumType   = 'sha512'
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
$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.1.zip'
  checksum       = '308a090ec1530aa8482f785d9632d8f7f57ee83ea485a7e91180d0b44cd2c1699c84b535de4700888127f199a1886d8bce5f013f4d7e042c02937689433bf807'
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

# environments registration
$zipName = [System.IO.Path]::GetFileNameWithoutExtension($packageArgs.url)
$env:JMETER_HOME = Join-Path $toolsPath $zipName
try {
  [Environment]::SetEnvironmentVariable('JMETER_HOME', $env:JMETER_HOME, 'Machine')
} catch {
  throw $_.Exception.Message
}

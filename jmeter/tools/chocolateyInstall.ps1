$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.2.1.zip'
  checksum       = 'd9127f7749357ccb37e325e27638a49ad38b8c7551aa6cfcc72e20f6bdd5fa9463173bbf6d7a22c351c15a10c0086d76a6acf3e7e623f988ef15067d82eddc59'
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

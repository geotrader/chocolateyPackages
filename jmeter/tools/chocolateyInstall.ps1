$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-4.0.zip'
  checksum       = 'acb4489bc875513ccc467782b3872e4adc048cd0fc8f375337dca8da82d48a83374ebfa749a8d3ae65163e32b5d11dfa44e557ca9b103b43d365dc6a6fc0ff56'
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

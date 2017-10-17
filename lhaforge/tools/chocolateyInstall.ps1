$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'lhaforge'
  url            = 'http://claybird.sakura.ne.jp/garage/lhaforge/lfarchive_1_6_6.zip'
  checksum       = 'C9B342D65F980C92061DA8BB1DA80F74E421A43D6EFCD4D6D635C0E04E81A07CF23BC1F3B870447347ADFFADF60E482F4E43B36EB41BACACFF4334B4E0B8298C'
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
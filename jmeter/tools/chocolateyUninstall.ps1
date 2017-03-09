# Remove custom shim
try {
  rm $env:ChocolateyInstall\bin\jmeter.bat
  rm $env:ChocolateyInstall\bin\jmeterw.cmd
} catch {
  throw $_.Exception.Message
}
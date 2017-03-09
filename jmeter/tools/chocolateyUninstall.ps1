# Remove custom shim
try {
  rm $env:ChocolateyInstall\bin\jmeter.cmd
  rm $env:ChocolateyInstall\bin\jmeterw.cmd
} catch {
  throw $_.Exception.Message
}
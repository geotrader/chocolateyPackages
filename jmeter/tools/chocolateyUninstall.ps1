# Remove custom shim
try {
  rm $env:ChocolateyInstall\bin\jmeter.bat
} catch {
  throw $_.Exception.Message
}
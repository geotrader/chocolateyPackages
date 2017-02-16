$packageName = 'jmeter'
 
try {
  # Remove custom shim
  rm $env:ChocolateyInstall\bin\jmeter.bat
  Write-ChocolateySuccess $packageName
 
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw 
}
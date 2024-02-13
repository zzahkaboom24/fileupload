[system.Diagnostics.Process]::Start("msedge","https://www.microsoft.com/en-us/software-download/windows10") 
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Microsoft Edge') 
Sleep 1
$wshell.SendKeys('{F12}') 
Sleep 1

# Check if the "Toggle device emulation" button is already active
if ($wshell.AppActivate('Toggle device emulation')) {
    # Device emulation is active, end the script
    Write-Host "Device emulation is already active. Exiting script."
    exit
}

# Device emulation is not active, send Ctrl+Shift+M to activate it
$wshell.SendKeys('^+{M}')
Sleep 1

# Send Ctrl+R to refresh the webpage
$wshell.SendKeys('^+R')

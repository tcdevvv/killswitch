$DriveLetter = "Z"  # Changed this to D for the USB drive
$ShutdownAction = "restart"  # Set this to "shutdown", "restart", or "test"

while ($true) {
    if (!(Test-Path "${DriveLetter}:\")) {
        # If the USB drive is removed, perform the action
        if ($ShutdownAction -eq "shutdown") {
            shutdown /s /f /t 0  # Shutdown
        }
        elseif ($ShutdownAction -eq "restart") {
            shutdown /r /f /t 0  # Restart
        }
        elseif ($ShutdownAction -eq "test") {
            # Output "Device Unplugged" to the console
            Write-Host "Device Unplugged." -ForegroundColor Green
        }
        break
    }
    Start-Sleep -Seconds 1  # Check every second
}

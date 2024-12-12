$DriveLetter = "D"  # USB drive letter to check for
$BatchFilePath = "D:\killswitch\launch.bat"  # Specify the full path to your batch file

while ($true) {
    if (Test-Path "${DriveLetter}:\" ) {
        # If the USB drive is plugged in, run the batch file
        if (Test-Path $BatchFilePath) {
            Start-Process $BatchFilePath  # Run the batch file
            Write-Host "Batch file executed." -ForegroundColor Green
        } else {
            Write-Host "Batch file not found!" -ForegroundColor Red
        }
        break  # Exit the loop after the batch file is executed
    }
    Start-Sleep -Seconds 1  # Check every second
}

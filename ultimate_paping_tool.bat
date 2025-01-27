@echo off
setlocal enabledelayedexpansion

:: Header
cls
echo =====================================================
echo                    Ultimate Paping Tool
echo =====================================================
echo This tool constantly checks a TCP port for connectivity
echo with faster intervals and real-time color-coded output.
echo =====================================================
echo.

:: Get user input for hostname and port
set /p host=Enter the hostname or IP address: 
set /p port=Enter the port to ping (TCP): 

:: Confirm inputs
echo =====================================================
echo Host: %host%
echo Port: %port%
echo Starting TCP ping... Press Ctrl+C to stop.
echo =====================================================

:: Run the high-speed TCP ping loop using PowerShell
powershell -NoProfile -Command ^
    "$host.UI.RawUI.ForegroundColor = 'White';" ^
    "Write-Host 'Pinging %host% on port %port% (TCP)...';" ^
    "while ($true) {" ^
        "try {" ^
            "$tcp = New-Object Net.Sockets.TcpClient('%host%', %port%);" ^
            "$tcp.Close();" ^
            "$host.UI.RawUI.ForegroundColor = 'Green';" ^
            "Write-Host ('[CONNECTED] %host%:%port% at ' + (Get-Date -Format HH:mm:ss.fff));" ^
        "} catch {" ^
            "$host.UI.RawUI.ForegroundColor = 'Red';" ^
            "Write-Host ('[DOWN]      %host%:%port% at ' + (Get-Date -Format HH:mm:ss.fff));" ^
        "}" ^
        "$host.UI.RawUI.ForegroundColor = 'White';" ^
        "Start-Sleep -Milliseconds 200;" ^
    "}"
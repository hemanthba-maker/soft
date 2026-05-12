# 1. Download and Install Java (Oracle JDK 21)
Write-Host "Downloading and installing Java..." -ForegroundColor Cyan
winget install -e --id Oracle.JDK.21 --accept-package-agreements --accept-source-agreements

# Refresh environment variables for the current session
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 2. Check Java Version
Write-Host "Verifying Java installation..." -ForegroundColor Cyan
try {
    $javaVer = java -version 2>&1 | Select-Object -First 1
    if ($javaVer -like "*version*") {
        Write-Host "Success! Found: $javaVer" -ForegroundColor Green
        
        # 3. Proceed to Install Eclipse
        Write-Host "Installing Eclipse IDE for Java Developers..." -ForegroundColor Cyan
        winget install -e --id EclipseFoundation.Eclipse.Java --accept-package-agreements
        Write-Host "Eclipse installation complete." -ForegroundColor Green
    } else {
        Write-Error "Java version not detected. Please restart your terminal and try again."
    }
} catch {
    Write-Error "Java is not installed or not in System PATH."
}

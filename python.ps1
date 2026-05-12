# 1. Download and Install Python (Latest 3.12 or 3.13)
Write-Host "Downloading and installing Python..." -ForegroundColor Cyan
# Using -e (exact id) to ensure the official Python Foundation package is used
winget install -e --id Python.Python.3.12 --accept-package-agreements --accept-source-agreements

# Refresh environment variables for the current session to recognize 'python'
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 2. Check Python Version
Write-Host "Verifying Python installation..." -ForegroundColor Cyan
try {
    # Check if python command is available and capture version string
    $pythonVersion = & python --version 2>$null
    if ($pythonVersion -match "Python 3") {
        Write-Host "Success! Found: $pythonVersion" -ForegroundColor Green
        
        # 3. Proceed to Install Jupyter Notebook
        Write-Host "Installing Jupyter Notebook via pip..." -ForegroundColor Cyan
        python -m pip install --upgrade pip
        python -m pip install jupyter
        
        Write-Host "Jupyter installation complete." -ForegroundColor Green
        Write-Host "You can now start it by typing 'jupyter notebook' in your terminal." -ForegroundColor Yellow
    } else {
        Write-Error "Python was installed but 'python' command is not responding. Please restart your terminal."
    }
} catch {
    Write-Error "Python installation failed or was not found in System PATH."
}

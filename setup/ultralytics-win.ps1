Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser 
# 1. Install Python 3.12 (specifically stable for CV/ML libraries)
Write-Host "Searching for Python 3.12..." -ForegroundColor Cyan
winget install --id Python.Python.3.12 --source winget --exact --accept-package-agreements --accept-source-agreements

# 2. Refresh the session so we can use 'python' immediately
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. Check if Python is now accessible
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "Python installed successfully!" -ForegroundColor Green
    
    Write-Host "Checking for Git..." -ForegroundColor Cyan

# Check if Git is already installed to avoid redundant work
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git is already installed. Skipping..." -ForegroundColor Green
} else {
    Write-Host "Git not found. Starting installation via Windows Package Manager..." -ForegroundColor Yellow
    
    # --accept-package-agreements: Bypasses the license prompt
    # --accept-source-agreements: Bypasses the winget source prompt
    # --silent: Ensures no UI popups interrupt the workshop
    winget install --id Git.Git --source winget --exact --accept-package-agreements --accept-source-agreements --silent
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Git installed successfully!" -ForegroundColor Green
        
        # Refresh Path so the 'git' command works in the current session
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } else {
        Write-Host "Installation failed. Please ensure you are running PowerShell as Administrator." -ForegroundColor Red
    }
}
    
    git clone https://github.com/mittechteam/CV_Workshop.git
    cd CV_Workshop

    # 5. Create and Activate Virtual Environment
    Write-Host "Setting up Virtual Environment..." -ForegroundColor Cyan
    python -m venv .venv
    .\.venv\Scripts\Activate.ps1

    # 6. Install Ultralytics and dependencies
    Write-Host "Installing Ultralytics (YOLO)..." -ForegroundColor Yellow
    python -m pip install --upgrade pip
    pip install -U ultralytics
    python test.py
} else {
    Write-Host "Installation failed. You may need to restart PowerShell or install Python manually from Python.org." -ForegroundColor Red
} # Click ENTER to continue ->

# 1. Enable script execution for the current session (Fixes .venv activation issues)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# 2. Install Python 3.12 and Git silently
Write-Host "Step 1/4: Installing Python 3.12 and Git..." -ForegroundColor Cyan
winget install --id Python.Python.3.12 --source winget --exact --accept-package-agreements --accept-source-agreements --silent
winget install --id Git.Git --source winget --exact --accept-package-agreements --accept-source-agreements --silent

# 3. Force refresh the Environment Path so 'python' and 'git' work immediately
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 4. Clone project and setup environment
if (-not (Test-Path "CV_Workshop")) {
    Write-Host "Step 2/4: Cloning Workshop Repository..." -ForegroundColor Cyan
    git clone https://github.com/mittechteam/CV_Workshop.git
}
cd CV_Workshop

Write-Host "Step 3/4: Creating Virtual Environment..." -ForegroundColor Cyan
python -m venv .venv
.\.venv\Scripts\Activate.ps1

# 5. Install CPU-Optimized Libraries (Crucial for machines with no GPU)
# Downgrading to 2.8.0 resolves WinError 1114 on many integrated graphics systems
Write-Host "Step 4/4: Installing CPU-only PyTorch & Ultralytics..." -ForegroundColor Yellow
python -m pip install --upgrade pip
pip install torch==2.8.0 torchvision==0.23.0 --index-url https://download.pytorch.org/whl/cpu
pip install -U ultralytics

Write-Host "`nSetup Successful! To test, run: python -c 'import torch; print(torch.__version__)'" -ForegroundColor Green

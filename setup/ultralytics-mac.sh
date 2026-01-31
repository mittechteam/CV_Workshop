#!/bin/bash

# 1. Install Python 3.12 and Git
echo "Updating Homebrew and installing dependencies..."
brew install python@3.12 git

# 2. Setup Directory
if [ ! -d "CV_Workshop" ]; then
    git clone https://github.com/mittechteam/CV_Workshop.git
fi
cd CV_Workshop

# 3. Virtual Environment (macOS uses 'python3')
echo "Setting up Virtual Environment..."
python3 -m venv .venv
source .venv/bin/activate

# 4. Install Ultralytics
echo "Installing Ultralytics..."
pip install --upgrade pip
pip install -U ultralytics

echo "Done! You are ready for the workshop."

# CV Workshop

### Installation for Windows
1. Go to [Windows Setup](setup/ultralytics-win.ps1)
2. Copy the script.
3. Paste in PowerShell/Windows Terminal of your laptop/PC.
4. Click ```Enter``` when prompted.
5. Follow the installation.

### Installation for MacOS/Linux
1. Go to [MacOS Setup](setup/setup/ultralytics-mac.sh) / [Linux Setup](setup/ultralytics-linux.sh)
2. Copy the script.
3. Paste in the Terminal of your Mac.
4. Follow the installation.

### VS Code Setup
1. Open VS Code. Go to   <img width="180" height="31" alt="image" src="https://github.com/user-attachments/assets/b05b2a32-ea3a-43b0-bebb-eae9093dc0f6" />
2. Browse to the cloned directory (Path shown at the end of installation)
3. Open the folder named 'CV_Workshop'
4. Open ```test.py``` and run it.

### Debug VS Code library issue
1. Go to the bottom left corner.
2. Click - <img width="333" height="112" alt="venv-issue-vscode" src="https://github.com/user-attachments/assets/02cb0c73-4aad-4f4a-9f9e-8bc3eae13117" />
3. Make sure it is set to -
    - ```.\.venv\Scripts\python``` for Windows.
    - ```venv\bin\python3``` for MacOS/Linux.




## To run from terminal -
### Activate Virtual Environment
1. PowerShell (Windows):
```
.\.venv\Scripts\Activate.ps1
```
2. Linux/MacOS:
```
source .venv/bin/activate
```

### Steps to Debug python path issue 
1. **Open Environment Variables**
    - Press ``Win`` and search for Environment Variables
    - Click on Edit the system environment variables.
    - In the System Properties window, click the Environment Variables button.
2. **Check path**
    - Under the User variables section, find and select the ``Path`` variable, then click Edit.
    - Select python path and press ``move up`` till it gets at the top.
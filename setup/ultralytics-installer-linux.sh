sudo apt update &&
sudo apt upgrade -y &&
sudo apt install git -y &&
sudo apt install python3 -y &&
apt install python3.13-venv -y &&
apt install python3-pip -y &&
git clone https://github.com/mittechteam/CV_Workshop.git &&
cd CV_Workshop &&
python -m venv env &&
source env/bin/activate &&
pip install --upgrade pip &&
pip install -U ultralytics &&
python test.py 

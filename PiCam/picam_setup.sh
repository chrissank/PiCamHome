#!/bin/bash

cd PiCam

read -p "Enter IP:port of server: " fullip

sed -i "7s/.*/FULLIP=\"${fullip}\"/" picam.sh

chmod u+x picam.sh
chmod u+x cleanup.sh
sudo cp picam.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable picam.service

echo "Setup complete. Reboot to enable."

(crontab -l 2>/dev/null; echo "0 1 * * * /home/pi/Documents/PiCam/cleanup.sh") | crontab -

#end
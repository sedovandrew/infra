#!/bin/bash

git clone https://github.com/Artemmkin/reddit.git
cd reddit 
bash -l -c bundle install

sudo cp /home/appuser/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service

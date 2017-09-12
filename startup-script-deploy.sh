#!/bin/bash

sudo -u appuser -i <<EOF
git clone https://github.com/Artemmkin/reddit.git
cd reddit 
bundle install
puma -d
EOF

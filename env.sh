#!/bin/bash

#env ops
conda env create -f env.yaml
eval "$(conda shell.bash hook)"
conda activate test
pip install -r requirements.txt
sudo apt-get update -y

#move into local/bin
SHELL_TARGDIR="/usr/local/bin"
REPO_TARGDIR="/usr/local"
CURRDIR=$(readlink -f "$0")
CURRDIR=$(dirname "$CURRDIR")

sudo ln -s $CURRDIR/mu /usr/local/bin
chmod 777 /usr/local/bin/mu
chmod +x ./uninstall.sh

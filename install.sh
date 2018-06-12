#!/usr/bin/env bash

git clone https://github.com/micheleriva/scarab.git ~/.scarab

echo "export SCARAB_DIR=\"~/.scarab\"" >> ~/.bashrc
echo "[ -s \"~/.scarab/nvm.sh\" ] && \. \"~/.scarab/nvm.sh\"" >> ~/.bashrc
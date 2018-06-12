#!/usr/bin/env bash

git clone https://github.com/micheleriva/scarab.git ~/.scarab

echo "# added by Scarab" >> ~/.bashrc
echo "export SCARABPATH=~/.scarab" >> ~/.bashrc
echo "export PATH=$PATH:$SCARABPATH/scarab.sh" >> ~/.bashrc
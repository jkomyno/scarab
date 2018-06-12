#!/usr/bin/env bash

git clone https://github.com/micheleriva/scarab.git ~/.scarab

echo "# added by Scarab" >> ~/.bash_profile
echo "export SCARABPATH=~/.scarab" >> ~/.bash_profile
echo "export PATH=$PATH:$SCARABPATH/scarab.sh" >> ~/.bash_profile
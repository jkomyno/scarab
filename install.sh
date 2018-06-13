#!/usr/bin/env bash

git clone https://github.com/micheleriva/scarab.git ~/.scarab

echo "# added by Scarab" >> ~/.bash_profile
echo "alias scarab='sh ~/.scarab/scarab.sh'" >> ~/.bash_profile

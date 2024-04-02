#!/bin/bash
# if you modify this file, you need to trigger a manual build
#
# run-parts will not go in infinite loop because it will ignore these files
# 01.sh
# lib.sh

set -xe

cd "$(dirname "$0")"

source lib.sh

setfacl -b /workspaces
umask 0022
echo "umask 0022" >> $HOME/.bashrc
chmod 0755 /workspaces
fd . --type d /workspaces/ | xargs chmod 775
mv /workspaces/codespaces-data-engineering /workspaces/codespaces-data-engineering-`date +%s`
clone codespaces-data-engineering
run-parts /workspaces/codespaces-data-engineering/update-content

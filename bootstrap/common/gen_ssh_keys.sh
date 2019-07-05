#!/bin/bash

source "$HOME/code/util/bootstrap/config.sh"
set -e

ssh-keygen -t rsa -b 4096 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add  ~/.ssh/id_rsa

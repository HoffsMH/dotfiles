#!/usr/bin/bash

set -e

source "./config.sh"

echo "###############################################"
echo "CREATING USER"
echo "###############################################"

useradd -m -g wheel $USERNAME
passwd $USERNAME

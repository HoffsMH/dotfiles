#! /bin/bash

echo "###############################################"
echo "GCLOUD"
echo "###############################################"

mkdir -p "$HOME/.config/google-cloud-sdk"
curl https://sdk.cloud.google.com >> "$HOME/.config/google-cloud-sdk/install.sh"
chmod +x "$HOME/.config/google-cloud-sdk/install.sh"
$HOME/personal/dotfiles/bootstrap/install/gcloud.exp

#!/usr/bin/bash

set -e

"$HOME/personal/dotfiles/bootstrap/scaffolding.sh"

"$HOME/personal/dotfiles/bootstrap/setup-util.sh"

"$HOME/personal/dotfiles/bootstrap/install/run.sh"

"$HOME/personal/dotfiles/bootstrap/misc/admin.sh"

# ./links/mac-hardware.sh

# ./misc/gen-ssh-keys.sh # no longer needed with yubikey



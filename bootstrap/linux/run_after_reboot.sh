#!/usr/bin/bash

set -e

source "$HOME/code/util/bootstrap/config.sh"

#./setup_networking.sh

./pacman_basics.sh

./create_dirs.sh

# manjaro can already have this enable only if yay is not already installed
#./install_yay.sh

./yay_basics.sh

./get_util.sh

./misc_admin.sh

./gen_util.sh

# link common
../common/link_recipe.sh

# link linux
./link_recipe.sh

# if on mac hardware
#./link_recipe_mac_hardware.sh

../common/gen_ssh_keys.sh


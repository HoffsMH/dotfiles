#!/usr/bin/bash

set -e

./pacman_basics.sh
./yay_basics.sh
../common/create_dirs.sh
../common/get_util.sh
./misc_admin.sh


# link common
../common/link_recipe.sh

# one OR the other depending on what hardware im installing to
#./link_recipe.sh
./link_recipe_mac_hardware.sh

../common/gen_ssh_keys.sh


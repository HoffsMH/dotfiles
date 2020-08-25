#!/usr/bin/bash

set -e

./scaffolding.sh

./setup_util.sh

./package_manager_installs.sh

./misc_admin.sh

# ./link_recipe_mac_hardware.sh

# ./misc/gen_ssh_keys.sh



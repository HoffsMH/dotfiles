#!/bin/bash


#! /bin/bash
set -e

echo "###############################################"
echo "XFCE"
echo "###############################################"

installs=(
  "xfce4" # 
  "xfce4-goodies" # 
  "manjaro-xfce-minimal-settings" #
)

echo $installs

echo $installs | xargs yay -S --noconfirm

#!/usr/bin/env bash

# This script is expected to run after first reboot to the system

set -euo pipefail

HOSTNAME="${1:?usage: ./after_install.sh <hostname>}"

DOTNAME="nixos-dotfiles"
DOTFILES="/etc/nixos/$DOTNAME"
LUKS_PARTITION="/dev/nvme0n1p2"

sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+7 "$LUKS_PARTITION"
sudo chown -R abhay:users "$DOTFILES"
cd "$DOTFILES"
git remote set-url origin git@github.com:abhayprabhakarannair/nixos-dotfiles

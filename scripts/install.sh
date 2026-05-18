#!/usr/bin/env bash

set -euo pipefail

HOSTNAME="${1:?usage: ./install.sh <hostname>}"

DOTNAME="nixos-dotfiles"
REPO="https://github.com/abhayprabhakarannair/$DOTNAME"
DOTFILES="/mnt/var/lib/$DOTNAME"

echo "========================================"
echo " Starting NixOS installation"
echo " Host: $HOSTNAME"
echo "========================================"

echo
echo "[1/6] Formatting and mounting disks..."
echo -n "Enter LUKES passphrase: "
read -s LUKS_PASSWORD
echo ""

sudo password="$LUKS_PASSWORD" nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode destroy,format,mount \
  "/home/nixos/$DOTNAME/hosts/$HOSTNAME/disko-config.nix"

echo
echo "[2/6] Cloning dotfiles..."
git clone "$REPO" "$DOTFILES"

echo
echo "[3/6] Generating hardware configuration..."
sudo nixos-generate-config \
  --no-filesystems \
  --root /mnt \
  --dir "$DOTFILES/hosts/$HOSTNAME"

echo
echo "[4/6] Cleaning generated configuration.nix..."
rm -f "$DOTFILES/hosts/$HOSTNAME/configuration.nix"

echo
echo "[5/6] Installing NixOS..."
cd "$DOTFILES"
sudo nixos-install --flake ".#$HOSTNAME"

echo
echo "[6/6] Setting password for user: abhay"
sudo nixos-enter --root /mnt -c 'passwd abhay'

echo
echo "========================================"
echo " NixOS installation complete"
echo " Host: $HOSTNAME"
echo "========================================"
echo
echo "You can now reboot into your new system."

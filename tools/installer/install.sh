#!/bin/sh

set -e  # Exit on error

# Clone GitHub repo into /etc/nixos
NIXOS_DIR="/mnt/etc/nixos"
GIT_REPO="https://github.com/DatLycan/NixOS-Config.git"

# Ensure the target directory exists and is empty
rm -rf "$NIXOS_DIR"
git clone "$GIT_REPO" "$NIXOS_DIR"

# Run disko using local installation
disko --mode disko "${NIXOS_DIR}/tools/installer/disko.nix"

# Generate config and install NixOS
nixos-generate-config --root /mnt
nixos-install --flake "${NIXOS_DIR}#default"
reboot

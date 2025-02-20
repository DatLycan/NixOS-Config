#!/bin/sh

set -e  # Exit on error

# Clone GitHub repo into /etc/nixos
NIXOS_DIR="/etc/nixos"
GIT_REPO="https://github.com/DatLycan/NixOS.git"

# Ensure the target directory exists and is empty
rm -rf "$NIXOS_DIR"
git clone "$GIT_REPO" "$NIXOS_DIR"

# Define variables
DISKO_CONFIG_URL="https://raw.githubusercontent.com/DatLycan/NixOS-Config/main/tools/installer/disko.nix"
FILE_NAME="disko.nix"

# Download the file from GitHub
curl -o "$FILE_NAME" "$DISKO_CONFIG_URL"

# Run disko using local installation
disko --mode disko "$FILE_NAME"

# Generate config and install NixOS
nixos-generate-config --root /mnt
nixos-install --flake "${NIXOS_DIR}#default"

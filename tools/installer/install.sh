#!/bin/sh

set -e  # Exit on error

# Define variables
GITHUB_URL="https://github.com/DatLycan/NixOS/blob/installer/tools/installer/disko.nix"
FILE="disko.nix"

# Download the file from GitHub
curl -o "$FILE_NAME" "$GITHUB_URL"

# Run disko
nix run disko --mode destroy,format,mount ./"$FILE_NAME"

# Generate config and install NixOS
nixos-generate-config --root /mnt
nixos-install

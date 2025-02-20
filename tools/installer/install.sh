#!/bin/sh

set -e  # Exit on error

NIXOS_DIR="/mnt/etc/nixos"
GIT_REPO="https://github.com/DatLycan/NixOS-Config.git"

DISKO_CONFIG_URL="https://raw.githubusercontent.com/DatLycan/NixOS-Config/refs/heads/main/tools/installer/disko.nix"
DISKO_FILE="disko.nix"


curl -o "${DISKO_FILE}" "$DISKO_CONFIG_URL"

disko --mode disko "${DISKO_FILE}"

rm -rf "$NIXOS_DIR"
git clone "$GIT_REPO" "$NIXOS_DIR"

rm -f "${NIXOS_DIR}/hardware-configuration.nix"
nixos-generate-config --root /mnt
rm -f "${NIXOS_DIR}/configuration.nix"

nixos-install --flake "${NIXOS_DIR}#default"
reboot

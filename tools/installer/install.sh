#!/bin/sh

NIXOS_DIR="/mnt/etc/nixos"
GIT_REPO="https://github.com/DatLycan/NixOS-Config.git"

set -e  # Exit on error

echo -e "\nTHIS WILL CLEAR YOUR DISK"

echo -e "\nInstallation will begin in 5 seconds. Press any key to cancel."
for i in $(seq 5 -1 1); do
    echo -n "$i "
    read -t 1 -n 1 key && echo -e "\n\nInstallation cancelled." && exit 1
done

echo -e "\n\nStarting installation..."

disko --mode disko /etc/disko.nix

rm -rf "$NIXOS_DIR"
git clone "$GIT_REPO" "$NIXOS_DIR"

rm -f "${NIXOS_DIR}/hardware-configuration.nix"
nixos-generate-config --root /mnt
rm -f "${NIXOS_DIR}/configuration.nix"

nixos-install --flake "${NIXOS_DIR}#default"
reboot

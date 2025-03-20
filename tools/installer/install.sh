#!/bin/sh

NIXOS_DIR="/mnt/etc/nixos"
GIT_REPO="https://github.com/DatLycan/NixOS-Config.git"
MIN_DISK_SIZE_GB=50  

set -e

check_internet() {
    ping -q -c 3 1.1.1.1 >/dev/null 2>&1
}

setup_wifi() {
    echo "No internet detected. Checking for a Wi-Fi adapter..."

    WIFI_DEVICE=$(iw dev | awk '$1=="Interface"{print $2}')
    
    if [ -n "$WIFI_DEVICE" ]; then
        echo "Wi-Fi adapter found: $WIFI_DEVICE"
        echo -e "Scanning for available networks...\n"
        
        iwlist "$WIFI_DEVICE" scan | grep 'SSID' | awk -F '"' '{print $2}'

        echo -n "Enter SSID: "
        read -r SSID
        echo -n "Enter Wi-Fi password: "
        read -r -s PASSWORD
        echo ""

        wpa_passphrase "$SSID" "$PASSWORD" | tee /etc/wpa_supplicant.conf >/dev/null
        
        ip link set "$WIFI_DEVICE" up
        wpa_supplicant -B -i "$WIFI_DEVICE" -c /etc/wpa_supplicant.conf
        
        echo "Establishing connection..."
        sleep 15  

        if check_internet; then
            echo "Wi-Fi connected successfully!"
            return 0
        else
            echo "Failed to connect to Wi-Fi. Please check credentials and try again."
            exit 1
        fi
    else
        echo "No Wi-Fi adapter detected. Please connect an Ethernet cable."
        exit 1
    fi
}

if ! check_internet; then
    setup_wifi
fi

rm -rf "$NIXOS_DIR"
git clone "$GIT_REPO" "$NIXOS_DIR"

AVAILABLE_CONFIGS=$(nix flake show --json "$NIXOS_DIR" | jq -r '.nixosConfigurations | keys[]' | grep -v '^installer$')

echo -e "\nAvailable configurations:"
echo "$AVAILABLE_CONFIGS"

while true; do
    echo -n "Enter the target configuration name: "
    read -r TARGET_CONFIG

    if echo "$AVAILABLE_CONFIGS" | grep -qx "$TARGET_CONFIG"; then
        break
    else
        echo -e "\nInvalid configuration. Please enter a valid name."
        echo -e "Available options:\n$AVAILABLE_CONFIGS"
    fi
done

echo -e "\nPlease select a disk for installation:"

DISKS=()
INDEX=0
while read -r disk size; do
    if ! udevadm info --query=property --name="$disk" | grep -q 'ID_BUS=usb'; then
        SIZE_GB=$((size / 1024 / 1024))
        if [ "$SIZE_GB" -ge "$MIN_DISK_SIZE_GB" ]; then
            DISKS+=("$disk")
            echo "$INDEX: $disk (${SIZE_GB}GB)"
            INDEX=$((INDEX + 1))
        fi
    fi
done < <(lsblk -dnbo NAME,SIZE | awk '{print "/dev/"$1, $2}')

if [ "${#DISKS[@]}" -eq 0 ]; then
    echo "No suitable disk found" >&2
    exit 1
fi

while true; do
    echo -n "Enter the index of the target disk: "
    read -r DISK_INDEX
    if [[ "$DISK_INDEX" =~ ^[0-9]+$ ]] && [ "$DISK_INDEX" -ge 0 ] && [ "$DISK_INDEX" -lt "${#DISKS[@]}" ]; then
        TARGET_DISK="${DISKS[$DISK_INDEX]}"
        break
    else
        echo "Invalid selection. Please choose a valid index."
    fi
done

echo -e "\nTHIS WILL CLEAR $TARGET_DISK"

echo -e "\nInstallation will begin in 5 seconds. Press any key to cancel."
for i in $(seq 5 -1 1); do
    echo -n "$i "
    read -t 1 -n 1 key && echo -e "\n\nInstallation cancelled." && exit 1
done

echo -e "\n\nStarting installation..."

export TARGET_DISK
disko --mode disko /etc/disko.nix

rm -f "${NIXOS_DIR}/hardware-configuration.nix"
nixos-generate-config --root /mnt
rm -f "${NIXOS_DIR}/configuration.nix"

echo -e "\nInstalling NixOS with configuration: $TARGET_CONFIG\n"

sleep 5

nixos-install --flake "${NIXOS_DIR}#${TARGET_CONFIG}"

reboot

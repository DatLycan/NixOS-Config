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
        
        # List available SSIDs
        iwlist "$WIFI_DEVICE" scan | grep 'SSID' | awk -F '"' '{print $2}'

        echo -n "Enter SSID: "
        read -r SSID
        echo -n "Enter Wi-Fi password: "
        read -r -s PASSWORD
        echo ""

        # Create a wpa_supplicant config file
        wpa_passphrase "$SSID" "$PASSWORD" | tee /etc/wpa_supplicant.conf >/dev/null
        
        # Bring up the Wi-Fi interface
        ip link set "$WIFI_DEVICE" up
        wpa_supplicant -B -i "$WIFI_DEVICE" -c /etc/wpa_supplicant.conf
        
        echo "Establishing connection..."
        sleep 15  

        # Re-check internet connectivity
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


# Function to detect the target disk (excluding USB & small disks)
detect_disk() {
    DISK_CANDIDATES=$(lsblk -dno NAME,TYPE,SIZE | awk '$2 == "disk" {print "/dev/"$1, $3}')

    for ENTRY in $DISK_CANDIDATES; do
        DISK=$(echo "$ENTRY" | awk '{print $1}')
        SIZE_GB=$(echo "$ENTRY" | awk '{print $2}' | sed 's/G//')

        if ! udevadm info --query=property --name="$DISK" | grep -q 'ID_BUS=usb'; then
            if [ "$(echo "$SIZE_GB >= $MIN_DISK_SIZE_GB" | bc)" -eq 1 ]; then
                echo "$DISK"
                return 0
            fi
        fi
    done

    echo "No suitable disk found" >&2
    exit 1
}

TARGET_DISK=$(detect_disk)

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
nixos-install --flake "${NIXOS_DIR}#${TARGET_CONFIG}"

reboot

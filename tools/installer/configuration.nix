{ config, version, system, modulesPath, pkgs, ...}:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ./disko.nix
    ../../modules/system/default-user.nix
  ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    gitMinimal
    disko
  ];

  default-user.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
  system.stateVersion = version;
}

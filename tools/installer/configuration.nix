{ config, version, system, modulesPath, pkgs, ...}:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ../../modules/system/default-user.nix
    ../../modules/system/default-editor
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
  default-editor.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
  system.stateVersion = version;
}

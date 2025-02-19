{ config, version, modulesPath, pkgs, lib, ...}:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./disko.nix
  ] ++ map (name: ../../modules/system + ("/" + name)) (builtins.attrNames (builtins.readDir ../../modules/system));

  # boot.loader.grub = {
  #   efiSupport = true;
  #   efiInstallAsRemovable = true;
  # };

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  system-config.enable = true;
  system-security.enable = true;

  default-user.enable = true;

  system.stateVersion = version;
}

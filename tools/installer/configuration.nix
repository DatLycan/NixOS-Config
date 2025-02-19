{ version, modulesPath, pkgs, lib, ...}:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./disko.nix
  ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.systemPackages = map lib.lowPrio [
    pkgs.wget
    pkgs.curl
    pkgs.gitMinimal
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "yes";
    };
  };

  system.stateVersion = version;
}

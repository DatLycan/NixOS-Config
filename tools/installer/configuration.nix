{ version, system, modulesPath, pkgs, ...}:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  environment.systemPackages = with pkgs; [
    curl
    gitMinimal
    disko
  ];

  networking.networkmanager.enable = true;

  environment.etc = {
    "install.sh".source = ./install.sh;
    "disko.nix".source = ./disko.nix;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
  system.stateVersion = version;
}

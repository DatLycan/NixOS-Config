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

  environment.etc = {
    "install.sh".source = ./install.sh;
    "disko.nix".source = ./disko.nix;
  };

  systemd.user.services.installScript = {
    description = "Run the install script on user login";
    wantedBy = [ "multi-user.target" ];

    script = builtins.readFile ./install.sh;
    serviceConfig.Type = "oneshot";
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
  system.stateVersion = version;
}

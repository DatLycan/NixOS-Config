{ config, version, system, modulesPath, pkgs, ...}:

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

  environment.etc."install.sh".source = ./install.sh;

  systemd.services.installScript = {
    description = "Make install.sh executable and run it on startup";
    wantedBy = [ "multi-user.target" ];

    serviceConfig.ExecStart = ''
      chmod +x /etc/install.sh
      /etc/install.sh
    '';
    serviceConfig.Type = "oneshot";
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
  system.stateVersion = version;
}

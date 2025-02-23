{ lib, config, pkgs, system, version, ... }:

let 
  cfg = config.system-config;
in
{
  options.system-config = {
    enable = lib.mkEnableOption "Enable system-config" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";

    environment.systemPackages = with pkgs; [
      wget
      curl
      git
      nix-ld
      wl-clipboard
      lazygit
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.hostPlatform = system;
    system.stateVersion = version;
  };

}

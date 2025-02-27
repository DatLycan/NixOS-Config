{
  lib,
  config,
  pkgs,
  system,
  version,
  ...
}: let
  cfg = config.default-config;
in {
  options.default-config = {
    enable =
      lib.mkEnableOption "Enable default-config"
      // {
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
      git-credential-oauth
    ];

    fonts.fontconfig = {
      subpixel.rgba = "rgb";
      hinting.autohint = true;
      hinting.style = "full";
    };

    programs.nix-ld.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.hostPlatform = system;
    system.stateVersion = version;
  };
}

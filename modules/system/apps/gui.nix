{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.gui-module;
in {
  options.gui-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = false;
      };

    virtualfs = lib.mkOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprland
      hyprlock
      hyprshot
      hyprpolkitagent
      waybar
    ];

    services.gvfs = {
      enable = cfg.virtualfs;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    programs = {
      hyprland.enable = true;
      hyprlock.enable = true;
    };

    fonts.fontconfig = {
      subpixel.rgba = "rgb";
      hinting.autohint = true;
      hinting.style = "full";
    };

    security.pam.services.hyprlock = {};
  };
}

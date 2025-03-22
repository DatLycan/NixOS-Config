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
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprland
      hyprlock
      hyprpolkitagent
      waybar
    ];

    services.gvfs.enable = true;

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

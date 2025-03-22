{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.gui;
in {
  options.gui = {
    enable =
      lib.mkEnableOption "Enable gui module"
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

    services.gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    programs = {
      hyprland.enable = true;
      hyprlock.enable = true;
    };

    security.pam.services.hyprlock = {};
  };
}

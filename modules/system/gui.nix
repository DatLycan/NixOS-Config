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
      waybar
    ];

    programs.hyprland.enable = true;
    programs.waybar.enable = true;
  };
}

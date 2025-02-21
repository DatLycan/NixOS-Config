{ pkgs, lib, config, ... }:

let 
  cfg = config.gui;
in
{
  options.gui = {
    enable = lib.mkEnableOption "Enable gui module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprland
      rofi-wayland
    ];

    programs.hyprland.enable = true;
  };
}

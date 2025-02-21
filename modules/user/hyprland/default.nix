{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
  ];

  environment.systemPackages = with pkgs; [
    hyprland
    rofi-wayland
  ];

  programs.hyprland.enable = true;
  wayland.windowManager.hyprland.enable = true;
}

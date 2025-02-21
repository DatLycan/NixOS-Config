{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    rofi-wayland
  ];

  programs.hyprland.enable = true;
}

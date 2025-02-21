{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
  ];

  home.packages = with pkgs; [
    hyprland
    wayland
    rofi-wayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

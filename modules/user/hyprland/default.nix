{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
    ./packages.nix
  ];

  home.packages = with pkgs; [
    hyprland
    wayland
    wayland-utils
    wlroots
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

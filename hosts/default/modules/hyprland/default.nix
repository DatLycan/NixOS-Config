{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
    ./packages.nix
  ];

  home.packages = with pkgs; [
    hyprland
  ];

  wayland.windowManager.hyprland.enable = true;
}

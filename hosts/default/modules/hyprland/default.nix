{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
  ];

  home.packages = with pkgs; [
    hyprland
  ];

  wayland.windowManager.hyprland.enable = true;
}

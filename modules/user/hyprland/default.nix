{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}

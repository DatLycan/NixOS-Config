{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

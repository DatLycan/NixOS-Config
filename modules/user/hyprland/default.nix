{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./binds.nix
    ./dependencies.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

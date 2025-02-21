{ pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./binds.nix
    ./style.nix
    ./dependencies.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

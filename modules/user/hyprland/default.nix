{ pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./binds.nix
    ./style.nix
    ./dependencies.nix

    ./plugins/hyprpanel.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

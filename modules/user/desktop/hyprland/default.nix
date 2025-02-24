{...}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ./style.nix
    ./dependencies.nix
    ./autostart.nix

    ./plugins/hyprpanel.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

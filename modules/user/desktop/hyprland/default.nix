{...}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ./style.nix
    ./dependencies.nix
    ./autostart.nix
    ./monitors.nix
    ./plugins
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}

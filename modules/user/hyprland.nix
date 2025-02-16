{ lib, config,... }:

{
  options = {
    hyprlandLayout = lib.mkOption {
      default = "Default";
      description = "Hyprland Window Layout";
    };
  };

  config = {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        general.layout = config.hyprlandLayout;
      };
    };
  };
}
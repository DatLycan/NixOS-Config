{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 13;
      border_size = 2;
      layout = "master";

      resize_on_border = true;
      allow_tearing = false;
    };

    decoration = {
      rounding = 6;
      active_opacity = 1.0;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1.0;

      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        ignore_opacity = true;
        xray = true;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "pop, 0.05, 0.9, 0.1, 1.05"
      ];
      animation = [
        "windows, 1, 5, pop"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 2, default"
        "workspaces, 1, 6, default"
      ];
    };

    misc = {
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
    };
  };
}

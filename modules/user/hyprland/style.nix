{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      layout = "master";

      resize_on_border = true;
      allow_tearing = false;
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
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

    misc.force_default_wallpaper = 0;
  };
}

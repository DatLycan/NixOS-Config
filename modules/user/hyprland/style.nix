{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 3;
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
      bezier = "overshot,0.13,0.99,0.29,1.1,";
      animation = [
        "fade,1,4,default"
        "workspaces,1,4,default,fade"
        "windows,1,4,overshot,popin 95%"
      ];
    };

    misc.force_default_wallpaper = 0;
  };
}

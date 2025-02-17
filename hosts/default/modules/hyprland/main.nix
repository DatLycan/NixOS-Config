
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred, 1080x720@60 ,auto";

      "$mainMod" = "SUPER";
      "$terminal" = "fish";
      "$fileManager" = "$terminal -e sh -c 'yazi'";
      "$menu" = "rofi-wayland";

      env = [
      ];

      exec-once = [
        "waybar"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        
        border_size = 2;

        "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        "col.inactive_border" = "rgba(3c3836ff)";

        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;

        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = false;
        };
        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_options = "grp:caps_toggle";
      };

      gestures = {
        workspace_swipe = false;
      };

      windowrules = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}

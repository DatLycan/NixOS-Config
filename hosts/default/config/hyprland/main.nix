{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
settings = {
      monitor = ",preferred, 1080x720@60 ,auto";

      env = {
        XCURSOR_SIZE = "14";
        HYPRCURSOR_SIZE = "24";
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        col = {
          active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          inactive_border = "rgba(595959aa)";
        };
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;

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
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrules = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
        "waybar"
      ];
    };
  };
}

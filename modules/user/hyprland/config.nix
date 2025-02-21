{
   wayland.windowManager.hyprland.settings = {
    env = [
      # Hint Electron apps to use Wayland
      "NIXOS_OZONE_WL,1"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "QT_QPA_PLATFORM,wayland"
      "XDG_SCREENSHOTS_DIR,$HOME/screens"
    ];

    monitor = ",1920x1080@144,auto,1"; 
    "$MOD" = "SUPER";
    "$TERMINAL" = "foot fish";
    "$FILE_MAN" = "foot yazi";
    "$MENU" = "rofi -show drun";


    exec-once = [ ];

    general = {
      layout = "master";
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "rgba(e5b9c6ff) rgba(c293a3ff) 45deg";
      "col.inactive_border" = "0xff382D2E";
      no_border_on_floating = false;
      resize_on_border = true;
      allow_tearing = false;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
      vfr = true;
      vrr = 0;
      animate_manual_resizes = true;
      mouse_move_focuses_monitor = true;
    };

    decoration = {
      rounding = 10;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
        # drop_shadow = false;
        # shadow_ignore_window = true;
        # shadow_range = 10;
        # shadow_render_power = 5;
        # "col.shadow" = "0x66404040";
      };

      blur = {
        enabled = false;
        # blur_size = 6;
        # blur_passes = 3;
        # blur_new_optimizations = true;
        # blur_xray = true;
        # blur_ignore_opacity = true;
      };
    };

    animations = {
      enabled = true;
    };

    input = {
      kb_layout = "us,ru,il";
      kb_options = "grp:caps_toggle";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "slave";
      new_on_top = true;
      mfact = 0.5;
    };



    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
    ];
  };
}

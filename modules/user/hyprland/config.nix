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
    "$TERMINAL" = "kitty";
    "$FILE_MAN" = "kitty superfile";
    "$MENU" = "rofi -show drun";


    exec-once = [ ];

    general = {
      gaps_in = 0;
      gaps_out = 0;

      border_size = 3;

      "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
      "col.inactive_border" = "rgba(3c3836ff)";

      resize_on_border = true;

      allow_tearing = false;
      layout = "master";
    };

    decoration = {
      rounding = 10;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
      };

      blur = {
        enabled = false;
      };
    };

    animations = {
      enabled = true;
    };

    input = {
      kb_layout = "us,ru,il";
      kb_options = "grp:caps_toggle";
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_invert = false;
      workspace_swipe_forever	= true;
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

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };

    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
    ];
  };
}

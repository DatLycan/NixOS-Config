{
  wayland.windowManager.hyprland.settings = {
    monitor = ", 2560x1080@144, auto, 1";

    env = [
      # Hint Electron apps to use Wayland
      "NIXOS_OZONE_WL,1"
      "QT_QPA_PLATFORM,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XDG_SCREENSHOTS_DIR,$HOME/screens"

      # Cursor
      # "HYPRCURSOR_THEME,"
      "HYPRCURSOR_SIZE,16"
      "XCURSOR_SIZE,16"

      # Fonts
      "FONT_NAME,JetBrains Mono 16"
      "FONT_ANTIALIASING,rgba"
      "FONT_HINTING,full"
    ];

    input = {
      kb_layout = "us";
      sensitivity = 0;
      force_no_accel = true;
    };

    exec-once = [
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    xwayland = {
      use_nearest_neighbor = false;
      force_zero_scaling = true;
    };
  };
}

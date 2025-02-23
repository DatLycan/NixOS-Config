{
   wayland.windowManager.hyprland.settings = {
    "$MOD" = "SUPER";
    "$TERMINAL" = "kitty fish";
    "$FILE_MAN" = "kitty superfile";
    "$MENU" = "rofi -show drun";

    monitor = ", 2560x1080@144, auto, 1"; 

    env = [
      # Hint Electron apps to use Wayland
      "NIXOS_OZONE_WL,1"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "QT_QPA_PLATFORM,wayland"
      "XDG_SCREENSHOTS_DIR,$HOME/screens"
    ];

    input = {
      kb_layout = "us";
      sensitivity = 0.05;
    };

    exec-once = [
      "hyprpanel"
    ];


    xwayland = {
      use_nearest_neighbor = false;
      force_zero_scaling = true;
    };
  };
}

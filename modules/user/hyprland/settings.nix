{
   wayland.windowManager.hyprland.settings = {
    "$MOD" = "SUPER";
    "$TERMINAL" = "kitty fish";
    "$FILE_MAN" = "kitty superfile";
    "$MENU" = "rofi -show drun";

    monitor = ", preferred, auto, 1"; 

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
      sensitivity = 0.1;
    };
  };
}

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
  };
}

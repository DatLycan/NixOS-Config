{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    # monitor = "eDP-1, 2880x1920@120, auto, 2";

    env = [
      # Hint Electron apps to use Wayland
      "NIXOS_OZONE_WL,1"
      "QT_QPA_PLATFORM,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XDG_SCREENSHOTS_DIR,$HOME/screens"

      # Fonts
      "FONT_NAME,JetBrains Mono 16"
      "FONT_ANTIALIASING,rgba"
      "FONT_HINTING,full"
    ];

    input = {
      kb_layout = "us";
      sensitivity = -0.37;
      force_no_accel = true;
    };

    exec-once = [
      "hypridle"
      "hyprlock"
      "waybar"
      "systemctl --user start hyprpolkitagent"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "sleep 3 && ${config.home.homeDirectory}/.config/hypr/scripts/monitor_autoswitch.sh"
    ];

    xwayland = {
      use_nearest_neighbor = false;
      force_zero_scaling = true;
    };

    windowrulev2 = [
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"

      "idleinhibit fullscreen, fullscreen:1"
    ];
  };
}

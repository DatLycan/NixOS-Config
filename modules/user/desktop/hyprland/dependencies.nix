{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    cliphist
    libnotify
    libsForQt5.xwaylandvideobridge
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    cliphist
    libnotify
    libsForQt5.xwaylandvideobridge
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}

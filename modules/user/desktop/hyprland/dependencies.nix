{pkgs, ...}: {
  home.packages = with pkgs; [
    cliphist
    libnotify
    glib
  ];
}

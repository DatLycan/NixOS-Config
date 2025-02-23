{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    rofi
    superfile
    cliphist
    mpv
  ];
}

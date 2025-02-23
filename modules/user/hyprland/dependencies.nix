{ pkgs, ... }:

{
  home.packages = with pkgs; [
    foot
    rofi
    superfile
    cliphist
    mpv
    walker
  ];
}

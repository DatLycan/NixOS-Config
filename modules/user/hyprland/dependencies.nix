{ pkgs, ... }:

{
  home.packages = with pkgs; [
    foot
    tofi
    superfile
    cliphist
    mpv
  ];
}

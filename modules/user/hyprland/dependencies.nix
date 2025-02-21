{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
    foot
    rofi
    yazi
  ];
}

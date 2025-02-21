{ pkgs, ... }:

{
  home.packages = with pkgs; [
    foot
    rofi

    brave
    vesktop
  ];
}

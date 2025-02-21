{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    rofi

    brave
    vesktop
  ];
}

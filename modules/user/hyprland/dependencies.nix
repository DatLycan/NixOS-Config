{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
    kitty
    rofi
    superfile
  ];
}

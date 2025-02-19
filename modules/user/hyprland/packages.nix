{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    rofi-wayland
    lazygit
    brave
    discordo
    diskonaut
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    walker

    brave
    discordo
  ];
}

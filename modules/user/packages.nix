{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    walker
    tofi

    brave
    discordo
  ];
}

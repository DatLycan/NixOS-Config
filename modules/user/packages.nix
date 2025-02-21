{ pkgs, ... }:

{
  home.packages = with pkgs; [
    superfile
    kitty
    walker
    tofi

    brave
    discordo
  ];
}

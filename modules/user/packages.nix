{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dorion
    vscodium
    brave
    grim
    swappy
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    yazi
    brave
  ];
}

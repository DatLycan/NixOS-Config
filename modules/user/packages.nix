{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    vesktop
  ];
}

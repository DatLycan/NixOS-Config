{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
    grim
    discord
    swappy
  ];
}

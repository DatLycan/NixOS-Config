{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dorion
    vscodium
  ];
}

{ inputs, system, pkgs, ... }:

{
  home.packages = with pkgs; [
    dorion
    vscodium
    inputs.zen-browser.packages."${system}".default
  ];
}

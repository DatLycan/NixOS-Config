{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dejavu_fonts
    jetbrains-mono
  ];
}

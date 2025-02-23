{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    libertine
    source-serif-pro
    stix-two
    vistafonts
    roboto
    jetbrains-mono
  ];
}

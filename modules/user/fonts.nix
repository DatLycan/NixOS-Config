{ pkgs, ... }:

{
  home.packages = with pkgs; [
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

  fonts.fontconfig.enable = true;
}

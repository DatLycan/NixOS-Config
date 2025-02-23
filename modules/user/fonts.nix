{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    dejavu-fonts
    fira-code
    roboto
    inter
    jetbrains-mono
  ];

  fonts.fontconfig.enable = true;
}

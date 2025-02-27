{pkgs, ...}: {
  home.packages = with pkgs; [
    dejavu_fonts
    nerd-fonts.jetbrains-mono
  ];
}

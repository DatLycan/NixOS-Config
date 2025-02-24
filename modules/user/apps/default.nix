{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
  ];

  home.packages = with pkgs; [
    vscodium
    vesktop
    spotify-qt
    mpv
  ];
}

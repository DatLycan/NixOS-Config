{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
  ];

  home.packages = with pkgs; [
    vscodium
    vesktop
    mpv
    spotify
    pavucontrol
    btop
    moonlight-qt
  ];
}

{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
    ./spotify
    ./vscode
    ./btop.nix
  ];

  home.packages = with pkgs; [
    vesktop
    mpv
    pavucontrol
    moonlight-qt
  ];
}

{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
    ./spotify
    ./vscode
    ./btop.nix
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    vesktop
    pavucontrol
    moonlight-qt
  ];
}

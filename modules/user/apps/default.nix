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
    discord
    pavucontrol
    moonlight-qt
    popsicle
  ];
}

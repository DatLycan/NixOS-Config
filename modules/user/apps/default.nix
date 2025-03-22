{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
    ./spotify
    ./vscode
    ./btop.nix
    ./mpv.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    discord
    pavucontrol
    moonlight-qt
    popsicle

    xfce.thunar
    xfce.thunar-volman
  ];
}

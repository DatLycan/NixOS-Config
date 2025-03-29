{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
    ./spotify
    ./vscode
    ./btop.nix
    ./mpv
    ./obs.nix
    ./homelab.nix
  ];

  home.packages = with pkgs; [
    discord
    pavucontrol
    moonlight-qt
    popsicle
    pinta
    gimp

    xfce.thunar
    xfce.thunar-volman
  ];
}

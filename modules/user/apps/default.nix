{pkgs, ...}: {
  imports = [
    ./brave
    ./superfile
    ./spotify
    ./btop.nix
    ./mpv
    ./obs.nix
    ./homelab.nix
    ./dev
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

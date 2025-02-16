{ config, pkgs, id, version, ... }:

{
  imports = [
    ../../modules/user.nix
  ];


  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = id.userName;
  home.homeDirectory = "/home/${id.userName}";
}

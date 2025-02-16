{ config, pkgs, common, version, ... }:

{
  imports = [
    ../../modules/user.nix
  ];


  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = config.default-user.userName;
  home.homeDirectory = "/home/${config.default-user.userName}";
}

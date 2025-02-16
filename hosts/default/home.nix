{ config, pkgs, common, version, ... }:

{
  imports = [
    ../../modules/user.nix
  ];


  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = common.default.userName;
  home.homeDirectory = "/home/${common.default.userName}";
}

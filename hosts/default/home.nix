{ config, pkgs, ... }:

let identity = import ../../common/resources/identity.nix;
in
{
  imports = [
    ../../modules/user.nix
  ];


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.username = identity.username;
  home.homeDirectory = "/home/${identity.username}";

}

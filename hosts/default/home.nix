{ config, pkgs, ... }:

{
  imports = [
    ../../modules/user.nix
  ];


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.username = "datlycan";
  home.homeDirectory = "/home/datlycan";

}

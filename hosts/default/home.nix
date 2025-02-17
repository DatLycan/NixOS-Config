{ pkgs, ... }:

{
  imports = [
    ./modules
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;
}

{ pkgs, ... }:

{
  imports = map (name: ./modules + "/${name}") (builtins.attrNames (builtins.readDir ./modules));

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;
}

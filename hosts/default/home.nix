{ pkgs, ... }:

{
  imports = map (name: ../../modules/user + "/${name}") (builtins.attrNames (builtins.readDir ../../modules/user));

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;
}

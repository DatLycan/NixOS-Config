{ ... }:

{
  imports = map (name: ../../modules/user + "/${name}") (builtins.attrNames (builtins.readDir ../../modules/user));
  
  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}

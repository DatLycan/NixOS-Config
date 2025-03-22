{...}: let
  userDir = ../../modules/user;
in {
  imports = map (name: userDir + "/${name}") (builtins.attrNames (builtins.readDir userDir));

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}

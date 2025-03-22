{...}: let
  modulesDir = ../../modules/user;
in {
  imports = map (name: modulesDir + "/${name}") (builtins.attrNames (builtins.readDir modulesDir));

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}

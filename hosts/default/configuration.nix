{ config, inputs, common, ... }:

{
  imports =
  [ 
    inputs.home-manager.nixosModules.default
  ] ++ map (name: ../../modules/system + ("/" + name)) (builtins.attrNames (builtins.readDir ../../modules/system));

  networking.hostName = common.default.hostName;

  system-config.enable = true;
  system-security.enable = true;

  default-user.enable = true;
  custom-nvf.enable = true;
  universal-style.enable = true;
  gui.enable = true;
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."${config.default-user.userName}" = import ./home.nix;
    backupFileExtension = "backup";
  };

  programs.nix-ld.enable = true; # TODO: Write a module for this vscode server as user module
}

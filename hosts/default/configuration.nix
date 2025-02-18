{ config, inputs, common, version, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ] ++ map (name: ../../modules/system + ("/" + name)) (builtins.attrNames (builtins.readDir ../../modules/system));

  networking.hostName = common.default.hostName;

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users."${config.default-user.userName}" = import ./home.nix;

  default-user.enable = true;
  default-editor.enable = true;
  default-style.enable = true;
  
  programs.nix-ld.enable = true; # TODO: Write a module for this vscode server as user module
}

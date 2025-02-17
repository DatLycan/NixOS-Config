{ config, inputs, common, version, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = common.default.hostName;

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs; 
    };

    users = { 
        "${config.default-user.userName}" = import ./home.nix; 
    };
  };

  config = {
    default-user.enable = true;
    default-terminal.enable = true;
  };
  
  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server as user module
}

{ config, inputs, common, version, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      
      builtins.mapAttrsToList (name: value: value) (builtins.readDir ../../modules);
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

  default-user.enable = true;
  default-editor.enable = true;
  default-style.enable = true;
  
  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server as user module
}

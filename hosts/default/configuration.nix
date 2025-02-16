{ inputs, id, version, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = id.userName;
  default-user.enable = true;

  security.sudo.extraRules = [{
    users = ["${id.userName}"];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs; 
      inherit id;
      inherit version;
    };
    users = {
      "${id.userName}" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server

  # services.getty.autologinUser = "${identity.userName}";
}

{ inputs, ... }:

let identity = import ../../common/resources/identity.nix;
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "${identity.username}";
  default-user.enable = true;

  security.sudo.extraRules = [{
    users = ["${identity.username}"];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "${identity.username}" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server

  # services.getty.autologinUser = "${identity.username}";
}

{ inputs, ... }:

let user = "datlycan";
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../common/system.nix
    ];

  networking.hostName = "nixos-personal";
  default-user.userName = user;
  default-user.enable = true;

  security.sudo.extraRules = [{
    users = [user];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  home-manager = {
    specialArgs = { inherit inputs; };
    users = {
      user = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server

  # services.getty.autologinUser = "datlycan";
}

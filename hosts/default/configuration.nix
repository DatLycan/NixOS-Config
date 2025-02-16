{ inputs, id, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      ../../modules/user.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = id.userName;
  default-user.enable = true;

  auto-manage-home = {
    enable = true;
    homeConfigPath = ./home.nix;
  };

  security.sudo.extraRules = [{
    users = ["${id.userName}"];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server

  # services.getty.autologinUser = "${identity.userName}";
}

{ inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "default";
  default-user.userName = "datlycan";
  default-user.enable = true;

  security.sudo.extraRules = [{
    users = ["datlycan"];
    commands = [{
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "datlycan" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server

  # services.getty.autologinUser = "datlycan";
}

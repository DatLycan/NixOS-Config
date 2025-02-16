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

  # auto-manage-home = {
  #   enable = true;
  #   homeConfigPath = ./home.nix;
  # };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server as user module

  # services.getty.autologinUser = "${identity.userName}";
}

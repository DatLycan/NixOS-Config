{ config, inputs, common, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      ../../modules/user.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = common.default.hostName;

  # auto-manage-home = {
  #   enable = true;
  #   users = {
  #     "${config.default-user.userName}" = import ./home.nix;
  #   };
  # };

  programs.nix-ld.enable = true; #TODO: Write a module for this vscode server as user module

  # services.getty.autologinUser = "${identity.userName}";
}

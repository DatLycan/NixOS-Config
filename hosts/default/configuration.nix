{ config, inputs, common, version, ... }:

{
  imports =
  [ 
    inputs.home-manager.nixosModules.default
  ] ++ map (name: ../../modules/system + ("/" + name)) (builtins.attrNames (builtins.readDir ../../modules/system));

  boot.loader = {
    grub.enable = true;
    grub.efiSupport = true;
    efi.efiSysMountPoint = "/boot";
  };
  
  networking.hostName = common.default.hostName;

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users."${config.default-user.userName}" = import ./home.nix;

  system-config.enable = true;
  system-security = {
    enable = true;
    # severity = "secure";
  };

  default-user.enable = true;
  default-editor.enable = true;
  default-style.enable = true;
  
  programs.nix-ld.enable = true; # TODO: Write a module for this vscode server as user module
}

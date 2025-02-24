{
  config,
  inputs,
  common,
  system,
  ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.default
    ]
    ++ map (name: ../../modules/system + ("/" + name)) (builtins.attrNames (builtins.readDir ../../modules/system));

  networking.hostName = common.default.hostName;

  default-config.enable = true;
  default-security.enable = true;
  default-user = {
    enable = true;
    autoLogin = true;
  };

  gui.enable = true;
  universal-style.enable = true;
  nvf.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit system;
      inherit common;
    };
    users."${config.default-user.userName}" = import ./user.nix;
    backupFileExtension = "backup";
  };

  programs.nix-ld.enable = true; # TODO: Write a module for this vscode server as user module
}

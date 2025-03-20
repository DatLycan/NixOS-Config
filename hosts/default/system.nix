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

  networking.hostName = "default";

  default-config.enable = true;
  default-security = {
    severity = "lockdown";
    enable = true;
  };
  default-user = {
    enable = true;
    autoLogin = true;
  };

  framework-config.enable = true;

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
}

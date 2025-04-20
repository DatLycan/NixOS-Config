{
  config,
  inputs,
  common,
  system,
  ...
}: let
  modulesDir = ../../modules/system;
  d-user = config.user-module.userName;
in {
  imports =
    [
      inputs.home-manager.nixosModules.default
    ]
    ++ map (name: modulesDir + ("/" + name)) (builtins.attrNames (builtins.readDir modulesDir));

  networking-module.hostName = "de-laptop";

  user-module.autoLogin = true;
  security-module.severity = "lockdown";

  bluetooth-module.enable = true;
  brightness-module.enable = true;
  fingerprint-module.enable = true;

  gui-module.enable = true;
  gui-module.virtualfs = true;
  stylix-module.enable = true;
  virtualisation-module.enable = true;

  usbip-module.enable = true;
  usbip-module.server.enable = true;

  nvf-module.enable = true;
  environment.sessionVariables.EDITOR = "nvim";

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit system;
      inherit common;
    };
    users."${d-user}" = import ./user.nix;
    backupFileExtension = "backup";
  };
}

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
    ++ (let
      systemDir = ../../modules/system;
      toImport = builtins.attrValues (builtins.mapAttrs (name: _: systemDir + ("/" + name)) (builtins.readDir systemDir));
    in
      toImport);

  networking.hostName = "de-laptop";

  default-config.enable = true;

  user-module.autoLogin = true;
  security-module.severity = "lockdown";

  bluetooth-module.enable = true;
  brightness-module.enable = true;
  fingerprint-module.enable = true;

  gui-module.enable = true;
  stylix-module.enable = true;
  nvf-module.enable = true;
  virtualisation-module.enable = true;

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

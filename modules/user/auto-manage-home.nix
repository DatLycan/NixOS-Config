{ lib, config, inputs, version, id, ... }:
let
  cfg = config.auto-manage-home;
in
{
  options.auto-manage-home = {
    enable = lib.mkEnableOption "Enable home-manager module";
  
    homeConfigPath = lib.mkOption {
      description = "Path to the home.nix configuration file";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      extraSpecialArgs = { 
        inherit inputs; 
        inherit id;
        inherit version;
      };
      users = {
        "${id.userName}" = import cfg.homeConfigPath;
      };
    };
  };
}

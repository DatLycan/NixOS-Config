{ lib, config, inputs, version, id, ... }:
let
  cfg = config.auto-manage-home;
in
{
  options.auto-manage-home = {
    enable = lib.mkEnableOption "Enable home-manager module"
  
    homeConfigPath = lib.mkOption {
      default = ./home.nix;
      description = "Default home.nix path";
    };
  };

  config = lib.mkIf config.auto-manage-home.enable {
    home-manager = {
      extraSpecialArgs = { 
        inherit inputs; 
        inherit id;
        inherit version;
      };
      users = {
        "${id.userName}" = import ;
      };
    };
  };
}

{ lib, config, inputs, version, ... }:
let
  cfg = config.auto-manage-home;
in
{
  options.auto-manage-home = {
    enable = lib.mkEnableOption "Enable home-manager module";

    users = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;  # Attribute set with paths as values
      description = "Users to be managed by home-manager, with their home configuration paths";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      extraSpecialArgs = { 
        inherit inputs; 
        inherit config; 
        inherit version;
      };
      users = lib.mapAttrs (_: path: import path) cfg.users;
    };
  };
}

{ lib, config, ... }:

let 
  cfg = config.default-style;
in
{


  options.default-style = {
    enable = lib.mkEnableOption "Enable default-style module" // {
      default = false;
    };

    theme = lib.mkOption {
      default = ./tokyodark.yaml
    };
  };

  config = lib.mkIf cfg.enable {
    stylix.base16Scheme = import cfg.theme;
  };
}

{ pkgs, lib, config, common, ... }:

let 
  cfg = config.default-style;
in
{
  options.default-style = {
    enable = lib.mkEnableOption "Enable default-style module" // {
      default = false;
    };

    theme = lib.mkOption {
      default = common.default.theme;
    };
  };

  config = lib.mkIf cfg.enable {
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";
  };
}

{
  pkgs,
  lib,
  config,
  common,
  ...
}: let
  cfg = config.universal-style;
in {
  options.universal-style = {
    enable =
      lib.mkEnableOption "Enable universal-style module"
      // {
        default = false;
      };

    theme = lib.mkOption {
      default = common.default.theme;
    };
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;

      polarity = "dark";
      base16Scheme = builtins.toPath ./themes/${cfg.theme}.yaml;
      image = builtins.toPath ./wallpapers/${cfg.theme}.png;

      cursor = {
        name = "DMZ-White";
        size = 24;
        package = pkgs.vanilla-dmz;
      };
    };
  };
}

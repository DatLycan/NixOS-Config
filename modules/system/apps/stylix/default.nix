{
  pkgs,
  lib,
  config,
  common,
  ...
}: let
  cfg = config.stylix-module;
in {
  options.stylix-module = {
    enable =
      lib.mkEnableOption ""
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
      image = ./wallpapers/${cfg.theme}.png;

      cursor = {
        name = "DMZ-White";
        size = 24;
        package = pkgs.vanilla-dmz;
      };
    };
  };
}

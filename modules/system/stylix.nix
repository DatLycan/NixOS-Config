{ pkgs, lib, config, common, ... }:

let 
  cfg = config.universal-style;
in
{
  options.universal-style = {
    enable = lib.mkEnableOption "Enable universal-style module" // {
      default = false;
    };

    theme = lib.mkOption {
      default = common.default.theme;
    };
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";
      image = pkgs.fetchurl {
        url = "https://github.com/atraxsrc/tokyonight-wallpapers/blob/main/crosses_original.png?raw=true";
        sha256 = "68d24637c68f2b60afd7510ddeb8027439357a65804485dad9e2d437af73ff25";
      };
    };
  };
}

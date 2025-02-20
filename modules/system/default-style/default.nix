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
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";
      image = pkgs.fetchurl {
        url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
        sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
      };
    };
  };
}

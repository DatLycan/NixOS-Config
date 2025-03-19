{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.framework-config;
in {
  options.framework-config = {
    enable =
      lib.mkEnableOption "Enable framework-config"
      // {
        default = false;
      };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      framework-tool
    ];
  };
}

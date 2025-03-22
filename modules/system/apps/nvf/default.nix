{
  lib,
  config,
  ...
}: let
  cfg = config.nvf-module;
in {
  imports = map (name: "./${name}");

  options.nvf-module = {
    enable = lib.mkEnableOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.enable = true;
  };
}

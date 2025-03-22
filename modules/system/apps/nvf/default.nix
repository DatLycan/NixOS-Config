{
  lib,
  config,
  ...
}: let
  cfg = config.nvf-module;
in {
  imports = [
    ./mappings.nix
    ./plugins.nix
    ./settings.nix
  ];

  options.nvf-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = false;
      };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.enable = true;
  };
}

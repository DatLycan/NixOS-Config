{ lib, config, ... }:

let 
  cfg = config.default-editor;
in
{
  imports = [
    ./nvf-settings.nix
    ./nvf-plugins.nix
    ./nvf-mappings.nix
  ];

  options.default-editor = {
    enable = lib.mkEnableOption "Enable default-editor module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.enable = true;
  };
}

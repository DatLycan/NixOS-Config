{ lib, config, ... }:

let 
  cfg = config.custom-nvf;
in
{
  imports = [
    ./nvf-settings.nix
    ./nvf-plugins.nix
    ./nvf-mappings.nix
  ];

  options.custom-nvf = {
    enable = lib.mkEnableOption "Enable custom-nvf module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.enable = true;
  };

}

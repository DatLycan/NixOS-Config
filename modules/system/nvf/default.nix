{ lib, config, ... }:

let 
  cfg = config.nvf;
in
{
  imports = [
    ./settings.nix
    ./plugins.nix
    ./mappings.nix
  ];

  options.nvf = {
    enable = lib.mkEnableOption "Enable nvf module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.enable = true;
  };

}

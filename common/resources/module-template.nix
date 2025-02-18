{ lib, config, ... }:

let 
  cfg = config.my-module;
in
{
  options.my-module = {
    enable = lib.mkEnableOption "Enable my-module module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    # Module logic goes here
  };
}

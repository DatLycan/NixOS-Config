{ lib, config, ... }:

let 
  cfg = config.default-style;
in
{
  options.default-style = {
    enable = lib.mkEnableOption "Enable default-style module" // {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    # Module logic goes here
  };
}

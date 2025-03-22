{
  lib,
  config,
  ...
}: let
  cfg = config.bluetooth-module;
in {
  options.bluetooth-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = false;
      };
    autostart = lib.mkOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = cfg.autostart;
    };
    services.blueman.enable = true;
  };
}

{
  lib,
  config,
  ...
}: let
  cfg = config.networking-module;
in {
  options.networking-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = true;
      };

    hostName = lib.mkOption {
      default = "default";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.hostName = cfg.hostName;
    networking.networkmanager.enable = true;

    services = {
      tailscale.enable = true;
    };
  };
}

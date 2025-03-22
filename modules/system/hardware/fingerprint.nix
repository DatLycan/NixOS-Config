{
  lib,
  config,
  ...
}: let
  cfg = config.fingerprint-module;
in {
  options.fingerprint-module = {
    enable = lib.mkEnableOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    services.fprintd.enable = true;

    security.pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
    };
  };
}

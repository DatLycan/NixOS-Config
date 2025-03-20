{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.framework-config;
in {
  options.framework-config = {
    enable =
      lib.mkEnableOption "Enable framework-config"
      // {
        default = false;
      };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      framework-tool
    ];

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };

    security.pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
    };

    services = {
      fwupd.enable = true;
      fprintd.enable = true;
      blueman.enable = true;
    };

    programs = {
      light.enable = true;
    };
  };
}

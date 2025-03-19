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
      libinput
    ];

    security.pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
    };

    services = {
      fwupd.enable = true;
      fprintd.enable = true;

      xserver.libinput = {
        enable = true;
        touchpad = {
          tapping = false;
          naturalScrolling = true;
          disableWhileTyping = true;
          accelProfile = "adaptive";
          accelSpeed = "0.8";
        };
      };
    };

    programs = {
      light.enable = true;
    };
  };
}

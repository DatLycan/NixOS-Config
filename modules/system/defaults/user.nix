{
  lib,
  config,
  common,
  ...
}: let
  cfg = config.user-module;
in {
  options.user-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = true;
      };

    userName = lib.mkOption {
      default = common.default.userName;
    };

    autoLogin = lib.mkOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "foobar";
      description = "Default user";
      extraGroups = ["wheel" "audio" "input"];
    };

    services.getty.autologinUser = lib.mkIf cfg.autoLogin cfg.userName;
  };
}

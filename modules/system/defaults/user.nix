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
      isnormaluser = true;
      initialpassword = "foobar";
      description = "Default user";
      extragroups = ["wheel" "audio" "input"];
    };

    services.getty.autologinUser = lib.mkIf cfg.autoLogin cfg.userName;
  };
}

{ lib, config, common, ... }:

let 
  cfg = config.default-user;
in
{
  options.default-user = {
    enable = lib.mkEnableOption "Enable default-user" // {
      default = false;
    };

    userName = lib.mkOption {
      default = common.default.userName;
      description = "Default User";
    };

    autoLogin = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable auto-login for the default user";
    };
  };

  config = lib.mkIf cfg.enable {  
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "foobar";
      description = "Default User";
      extraGroups = [ "wheel" "audio" ];
    };

    services.getty.autologinUser = lib.mkIf cfg.autoLogin cfg.userName;
  };
}

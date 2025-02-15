{ lib, config, ... }:

{
  options = {
    default-user.enable = lib.mkEnableOption "Enable user module";

    default-user.userName = lib.mkOption {
      default = "datlycan";
      description = "Default User";
    };
  };

  config =lib.mkIf config.main-user.enable {  
    users.users.${config.default-user.userName} = {
      isNormalUser = true;
      initialPassword = "default";
      description = "Default User";
      useDefaultShell = true;
    };
  };
}

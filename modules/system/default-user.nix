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
  };

  config = lib.mkIf cfg.enable {  
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "foobar";
      description = "Default User";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keyFiles = [ ../../common/resources/authorized_keys ];
    };
  };
  
}

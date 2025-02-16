{ lib, config, common, ... }:

let 
  cfg = config.default-user;
in
{
  options.default-user = {
    enable = lib.mkEnableOption "Enable user module" // {
      default = true;
    };

    userName = lib.mkOption {
      default = common.default.userName;
      description = "Default User";
    };
  };

  config = lib.mkIf cfg.enable {  
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "default";
      description = "Default User";
      extraGroups = [ "wheel" ];
    };
  };
  
}

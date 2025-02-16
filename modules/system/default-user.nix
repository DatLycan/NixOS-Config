{ lib, config, id, ... }:

let 
  cfg = config.default-user;
in
{
  options.default-user = {
    enable = lib.mkEnableOption "Enable user module";

    userName = lib.mkOption {
      default = id.userName;
      description = "Default User";
    };
  };

  config = lib.mkIf cfg.enable {  
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "default";
      description = "Default User";
      useDefaultShell = true;
      extraGroups = [ "wheel" ];
    };
  };
  
}

{ lib, config, id, ... }:

let 
  cfg = config.default-user;
in
{
  options.default-user = {
    enable = lib.mkEnableOption "Enable user module";

    userName = lib.mkOption {
      default = "${id.userName}";
      description = "Default User";
    };
  };

  config = lib.mkIf config.default-user.enable {  
    users.users.${config.default-user.userName} = {
      isNormalUser = true;
      initialPassword = "default";
      description = "Default User";
      useDefaultShell = true;
      extraGroups = [ "wheel" ];
    };
  };
}

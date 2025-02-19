{ lib, config, common, ... }:

let 
  cfg = config.security;
in
{
  options.security = {
    enable = lib.mkEnableOption "Enable system-security" // {
      default = false;
    };

    severity = lib.mkOption {
      type = lib.types.enum [
        "unprotected" 
        "secure"
        "lockeddown"
      ];
      default = "unprotected";
      description = "System protection level";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    
    # Unprotected: Less secure settings
    (lib.mkIf (cfg.severity == "unprotected") {
      security.sudo.extraRules = [{
        users = [ config.default-user.userName ]; #Change this to be dynamic with the default user module
        commands = [{
          command = "ALL";
          options = [ "NOPASSWD" ];
        }];
      }];

      services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
          PasswordAuthentication = true;
          AllowUsers = null;
          PermitRootLogin = "yes";
          X11Forwarding = true;
        };
      };

      services.getty.autologinUser = config.default-user.userName;
    })

    # TODO Secure: Moderate security settings
    # (lib.mkIf (cfg.severity == "secure") { })

    # TODO Locked Down: Maximum security settings
    # (lib.mkIf (cfg.severity == "lockeddown") { })
  ]);
}

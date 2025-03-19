{
  lib,
  config,
  ...
}: let
  cfg = config.default-security;
in {
  options.default-security = {
    enable =
      lib.mkEnableOption "Enable default-security"
      // {
        default = false;
      };

    severity = lib.mkOption {
      type = lib.types.enum [
        "unprotected"
        "secure"
        "lockdown"
      ];
      default = "secure";
      description = "System protection level";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    (lib.mkIf (cfg.severity == "unprotected") {
      security.sudo.extraRules = [
        {
          users = [config.default-user.userName];
          commands = [
            {
              command = "ALL";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];

      services.openssh = {
        enable = true;
        ports = [22];
        settings = {
          PasswordAuthentication = true;
          AllowUsers = null;
          PermitRootLogin = "yes";
        };
      };

      services.getty.autologinUser = config.default-user.userName;
    })

    (lib.mkIf (cfg.severity == "secure") {
      security.sudo.extraRules = [
        {
          users = [config.default-user.userName];
          commands = [
            {
              command = "ALL";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];

      services.openssh = {
        enable = true;
        ports = [22];
        settings = {
          PasswordAuthentication = true;
          AllowUsers = [config.default-user.userName];
          PermitRootLogin = "prohibit-password";
        };
      };
    })

    (lib.mkIf (cfg.severity == "lockdown") {
      security.sudo.extraRules = [
        {
          users = [config.default-user.userName];
          commands = [];
        }
      ];

      services.openssh.enable = false;
    })
  ]);
}

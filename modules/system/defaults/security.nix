{
  lib,
  config,
  ...
}: let
  cfg = config.security-module;
  d-user = config.user-module.userName;
in {
  options.security-module = {
    enable = lib.mkEnableOption {
      default = true;
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
          users = [d-user];
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
          AllowUsers = [d-user];
          PermitRootLogin = "prohibit-password";
        };
      };
    })

    (lib.mkIf (cfg.severity == "lockdown") {
      security.sudo.extraRules = [
        {
          users = [d-user];
          commands = [];
        }
      ];

      services.openssh.enable = false;
    })
  ]);
}

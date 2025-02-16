{ lib, config, id, ... }:

let 
  cfg = config.security;
in
{
  options.security = {
    enable = lib.mkEnableOption "Enable user module" // {
      default = true;
    };

    severity = lib.mkOption {
      type = lib.types.enum [
        "unprotected" 
        "secure"
        "lockeddown"
      ];
      default = "secure";
      description = "System protection level";
    };
  };

  config = lib.mkIf cfg.enable {  
    security = lib.mkMerge [
      (lib.mkIf (cfg.severity == "unprotected") (throw "Security level 'unprotected' is not implemented."))
      (lib.mkIf (cfg.severity == "secure") (throw "Security level 'secure' is not implemented."))
      (lib.mkIf (cfg.severity == "lockeddown") (throw "Security level 'lockeddown' is not implemented."))
    ];
  };
}

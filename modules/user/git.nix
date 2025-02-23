{ common, ... }:

{
  programs.git = {
    enable = true;
    userName = common.default.displayName;
    userEmail = common.default.email;
    extraConfig = {
      safe.directory = "/etc/nixos";
      credential.helper = [
        "cache --timeout 21600"
        "oauth"  
      ];
    };
  };
}

{ common, ... }:

{
  programs.git = {
    enable = true;
    userName = common.default.displayName;
    userEmail = common.default.email;
    extraConfig = {
      credential.helper = "oauth";
    };
  };
}

{ common, ... }:

{
  programs.git = {
    enable = true;
    userName = common.default.displayName;
    userEmail = common.default.email;
    etraConfig = {
      credential.helper = "oauth";
    };
  };
}

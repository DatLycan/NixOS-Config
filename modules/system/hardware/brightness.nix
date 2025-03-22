{
  lib,
  config,
  ...
}: let
  cfg = config.brightness-module;
  d-user = config.user-module.userName;
in {
  options.brightness-module = {
    enable = lib.mkEnableOption {
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.light.enable = true;
    users.groups.video.members = [d-user];
  };
}

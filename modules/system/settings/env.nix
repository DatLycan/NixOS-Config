{
  lib,
  config,
  system,
  version,
  ...
}: let
  cfg = config.env-module;
in {
  options.env-module = {
    enable =
      lib.mkEnableOption ""
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.hostPlatform = system;
    system.stateVersion = version;
  };
}
